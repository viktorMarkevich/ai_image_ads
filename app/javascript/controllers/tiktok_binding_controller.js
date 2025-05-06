import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["campaignSelect"]

    updateAdgroups(event) {
        const campaignId = this.campaignSelectTarget.value
        console.log(campaignId)
        const url = `/tiktok/adgroups?campaign_id=${campaignId}`

        fetch(url, {
            headers: { "Accept": "text/vnd.turbo-stream.html" }
        })
    }
}

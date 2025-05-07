# app/services/tiktok_adgroups_fetcher.rb
class TiktokAdgroupsFetcher
  def self.call(campaign_id)
    advertiser_id = ENV['TIKTOK_ADVERTISER_ID']
    access_token = ENV['TIKTOK_ACCESS_TOKEN']

    filtering = { campaign_ids: [campaign_id] }.to_json

    uri = URI("https://business-api.tiktok.com/open_api/v1.3/adgroup/get/")
    params = {
      advertiser_id: advertiser_id,
      filtering: filtering
    }
    uri.query = URI.encode_www_form(params)

    req = Net::HTTP::Get.new(uri)
    req['Access-Token'] = access_token
    req['Content-Type'] = 'application/json'

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end

    case res
    when Net::HTTPSuccess
      JSON.parse(res.body)['data']['list']
    else
      puts "HTTP Error: #{res.code} - #{res.message}"
      nil
    end
  end
end

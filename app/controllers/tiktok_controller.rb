class TiktokController < ApplicationController
  # def campaigns
  #   advertiser_id = ENV["TIKTOK_ADVERTISER_ID"]
  #   client = TiktokBusinessApi.client(access_token: ENV["TIKTOK_ACCESS_TOKEN"])
  #   @campaigns = client.campaigns.list(advertiser_id)["data"]["list"]
  #
  #   render partial: "contexts/campaign_select", locals: { context: Context.new, campaigns: @campaigns }
  # end

  def adgroups
    campaign_id = params[:campaign_id]
    @context = Context.new(campaign_id: campaign_id)
    @adgroups = TiktokAdgroupsFetcher.call(campaign_id)
    p '*'*100
    p @adgroups
    p '*'*100

    render turbo_stream: turbo_stream.replace(
      "adgroups_frame",
      partial: "contexts/adgroup_select",
      locals: { context: @context, adgroups: @adgroups }
    )

    render partial: "contexts/adgroup_select", locals: { context: Context.new, adgroups: @adgroups }
  end
end

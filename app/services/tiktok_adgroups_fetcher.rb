# app/services/tiktok_adgroups_fetcher.rb
class TiktokAdgroupsFetcher
  def self.call(campaign_id)
    client = TiktokBusinessApi.client(access_token: ENV['TIKTOK_ACCESS_TOKEN'])
    response = client.ad_groups.list(advertiser_id: ENV['TIKTOK_ADVERTISER_ID'], campaign_id: campaign_id)
    response
  rescue => e
    Rails.logger.error "TikTok adgroups error: #{e.message}"
    []
  end
end

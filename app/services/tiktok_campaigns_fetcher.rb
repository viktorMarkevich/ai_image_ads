# app/services/tiktok_campaigns_fetcher.rb
class TiktokCampaignsFetcher
  def self.call
    client = TiktokBusinessApi.client(access_token: ENV['TIKTOK_ACCESS_TOKEN'])
    response = client.campaigns.list(advertiser_id: ENV['TIKTOK_ADVERTISER_ID'])
    response
  rescue => e
    Rails.logger.error "TikTok campaigns error: #{e.message}"
    []
  end
end

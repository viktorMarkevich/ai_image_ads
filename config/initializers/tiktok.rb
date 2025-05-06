# config/initializers/tiktok.rb
TiktokBusinessApi.configure do |config|
  config.app_id = ENV['TIKTOK_APP_ID']
  config.secret = ENV['TIKTOK_APP_SECRET']
  config.debug = true
  config.logger = Logger.new(STDOUT)
end

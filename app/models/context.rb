class Context
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :industry_description, type: String
  field :landing_page_url, type: String
  field :ad_ideas, type: Array, default: []

  field :tiktok_campaign_id, type: String
  field :tiktok_adgroup_id, type: String

  has_many :generated_images, dependent: :destroy
end

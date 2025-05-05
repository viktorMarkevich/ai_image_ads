class GeneratedImage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :prompt, type: String
  field :url, type: String
  field :source, type: String, default: "openai" # TODO: need to manage with list of required APIs.
  field :selected, type: Boolean, default: false

  belongs_to :context
end

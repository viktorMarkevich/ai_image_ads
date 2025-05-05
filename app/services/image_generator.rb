# app/services/image_generator.rb
class ImageGenerator
  def initialize#(context)
    # @context = context
    @context = Context.where(name: 'Food').first # temporary
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"], log_errors: true)
  end

  def call
    @context&.ad_ideas.each do |prompt|
      response = @client.images.generate(
        parameters: {
          prompt: prompt,
          size: "1024x1024", # TODO: need to use MiniMagick to trim it according to the task description.("Vertical (recommend): 9:16, ≥720*1280p"),
                             #  Supported values are: '256x256', '512x512', and '1024x1024'.
          response_format: "url"
        }
      )

      url = response.dig("data", 0, "url")

      p url
      p '*'*100
      # if url
      #   @context.some_generated_image_model.create!(
      #     # model columns
      #   )
      # end
    end
  end
end

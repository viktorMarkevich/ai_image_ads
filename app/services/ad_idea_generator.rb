# app/services/ad_idea_generator.rb
class AdIdeaGenerator
  def initialize(context)
    @context = context
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"], log_errors: true)
  end

  def call
    prompt = <<~PROMPT
      You are an experienced marketer. Create 4 short, engaging TikTok ad image ideas on the following topics:
      Industry: #{@context.industry_description}
      Landing page: #{@context.landing_page_url}
      
      Format: List of 4 short phrases.
    PROMPT

    # p @client
    # p '*'*100

    begin
      response = @client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: prompt }],
          temperature: 0.7
        }
      )

      result = response.dig("choices", 0, "message", "content")
      result.split("\n").map(&:strip).reject(&:empty?)
    rescue Faraday::TooManyRequestsError => e
      Rails.logger.error("OpenAI rate limited: #{e.message}")
      []
    end
  end
end

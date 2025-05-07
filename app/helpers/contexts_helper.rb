module ContextsHelper
  def button_name
    if @context.ad_ideas.any? && @context.generated_images.any?
      return 'Generate Images Again'
    end

    if @context.ad_ideas.any? && @context.generated_images.blank?
      'Generate images'
    end
  end
end

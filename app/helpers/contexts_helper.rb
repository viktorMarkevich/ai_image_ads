module ContextsHelper
  def render_image_generation_cta(context)
    if context.ad_ideas.any?
      button_name = context.generated_images.any? ? 'Generate images again' : 'Generate images'
      button_to button_name, generate_images_context_path(context), method: :post
    else
      raw("<span style='color: orange'>Please, generate ideas first</span>")
    end
  end
end

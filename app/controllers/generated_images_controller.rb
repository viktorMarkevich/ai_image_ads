class GeneratedImagesController < ApplicationController
  def choose
    image = GeneratedImage.find(params[:id])
    image.update(selected: true)
    redirect_back fallback_location: context_path(image.context), notice: "The image was selected!"
  end
end

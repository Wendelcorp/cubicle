class ImagesController < ApplicationController
  def index
    img_array = {}
    spaces = Space.all
    for space in spaces
      img_array[space.id] = space.images.first.location_picture.url(:thumb)
    end

    respond_to do |format|
      format.html
      format.json {render json: img_array}
    end
  end
  def destroy
  end

end

# image.location_picture.url(:medium)

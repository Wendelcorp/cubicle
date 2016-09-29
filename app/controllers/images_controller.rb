class ImagesController < ApplicationController
  def index
    img_array = []
    spaces = Space.all
    for space in spaces
      img_array << space.images.first
    end

    respond_to do |format|
      format.html
      format.json {render json: img_array}
    end
  end
  def destroy
  end

end

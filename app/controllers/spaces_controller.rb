class SpacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @spaces = Space.all
  end

  def new
    @space = Space.new
    @address = Address.new
  end

  def create
    @space = Space.new(space_params)
    @space.user_id = current_user.id

    if @space.save
      flash[:sucess] = 'New Space succesfully added'
      redirect_to spaces_path
    else
      flash[:notice] = "this didnt save "
      render :new
    end
  end
  
  def show
    @space = Space.find(params[:id])
  end

  private

  def space_params
    params.require(:space).permit(:name, 
                              :available_desks, 
                              :description,
                              :price,
                              :user_id,
                              address_attributes:
                              [:number, :street_name, :city,
                               :province, :postal_code])
  end


end
















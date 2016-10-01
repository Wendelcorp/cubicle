class SpacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_logged_in, only: [:destroy, :edit, :update]

  def index
    @spaces = Space.all

    respond_to do |format|
      format.html
      format.json { render json: @spaces}
    end
  end

  def new
    @space = Space.new
  end

  def create
    @user = current_user
    @space = @user.owned_spaces.new(space_params)

    if @space.save!
      flash[:sucess] = 'New Space succesfully added'
      redirect_to spaces_path
    else
      flash[:notice] = "this didnt save "
      render :new
    end
  end

  def show
    @space = Space.find(params[:id])
    @leases = @space.leases
    available_spaces = @space.available_desks
    available_leases = Space.available_leases(@space)
    taken_desks = Space.taken_desks(available_leases)
    @remaining_desks = available_spaces - taken_desks
    @price_per_desk = @space.price
    @hash = Gmaps4rails.build_markers(@space) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @user = current_user
    @space = Space.find(params[:id])
    if @space.update_attributes!(space_params)
      flash[:sucess] = 'project succesfully updated'
      redirect_to space_path(@space)
    else
      flash[:notice] = 'this didnt update'
      redirect_to root_path
    end
  end

  def destroy
    #important, if you destroy the space, you have to destroy the associated leases
    @space = Space.find(params[:id])
    Lease.where(space_id: @space.id).destroy_all
    @space.destroy
  end


  private

  def space_params
    params.require(:space).permit(:name,
                                  :description,
                                  :available_desks,
                                  :price,
                                  :user_id,
                                  :number,
                                  :street_name,
                                  :city,
                                  :province,
                                  :postal_code,
                                  images_attributes: [:id, :location_picture, :_destroy])
  end

  def ensure_logged_in
    @space = Space.find(params[:id])
    if current_user != User.find(@space.user_id)
      redirect_to spaces_path, notice: "you do not have access"
    end
  end


end


# to_query

# url    = 'http://www.foo.com?id=4&empid=6'
# uri    = URI.parse(url)
# params = CGI.parse(uri.query)
# # params is now {"id"=>["4"], "empid"=>["6"]}
#
# id     = params['id'].first
# # id is now "4"

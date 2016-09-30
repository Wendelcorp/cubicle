class LeasesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def new
    @space = Space.find(params[:space_id])
    @lease = Lease.new
    @months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
  end
  def create
    @space = Space.find(params[:space_id])
    @months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    @user = current_user
    @lease = @space.leases.create(lease_params)
    @lease.status_id = 1
    @lease.user_id = @user.id

    if @lease.save
      redirect_to space_path(@space), :notice => "the lease request has been sent to the user"
    else
      render :new
    end
  end

  private

  def lease_params
    params.require(:lease).permit(:desks, :user_id, :month, :space_id)
  end

end

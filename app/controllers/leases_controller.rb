class LeasesController < ApplicationController
  before_action :authenticate_user!
  def new
    @lease = Lease.new
  end
  def create
    @space = Space.find(params[:id])
    @user = current_user
    @lease = @space.pledges.new(pledge_params)
    @lease.user = @user

    if @lease.save
      redirect_to space_path(@space), :notice => "the lease was created"
    else
      render :new
    end
  end

  def pledge_params
    params.require(:lease).permit(:desks, :user_id, :month, :space_id)
  end

end

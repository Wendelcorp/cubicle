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
      redirect_to space_path(@space), :notice => "Lease request submitted."
    else
      render :new
    end
  end

  def update
    @lease = Lease.find(params[:id]);

    if params[:status] == 'accept'
      status = Status.find_by_name("accept").id
      @lease.status_id = status
    elsif params[:status] == 'reject'
      status = Status.find_by_name("reject").id
      @lease.status_id = status
    end

    if @lease.save!
      respond_to do |format|
        format.html
        format.json { render json: { name:@lease.status.name, id:@lease.id }}
      end
    end
  end


  private

  def lease_params
    params.require(:lease).permit(:desks, :user_id, :month, :space_id)
  end

end

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user == User.find(params[:id])
      @user = User.find(params[:id])
      @leases = @user.leases
      @spaces = @user.owned_spaces
    else
      redirect_to spaces_path, notice: "you do not have access"
    end
  end
end

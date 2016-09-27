class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_logged_in

  def show
    @user = User.find(params[:id])
    @leases = @user.leases
    @spaces = @user.owned_spaces
  end


  private

  def ensure_logged_in
    if current_user != User.find(params[:id])
      redirect_to spaces_path, notice: "you do not have access"
    end
  end


end

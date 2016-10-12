class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_logged_in

  def show
    @user = User.find(params[:id])
    @leases = @user.leases
    @spaces = @user.owned_spaces
    @months_hash = {1 => 'January',
              2 => 'February',
              3 => 'March',
              4 => 'April',
              5 => 'May',
              6 => 'June',
              7 => 'July',
              8 => 'August',
              9 => 'September',
              10 => 'October',
              11 => 'November',
              12 => 'December'
              }
  end


  private

  def ensure_logged_in
    if current_user != User.find(params[:id])
      redirect_to spaces_path, notice: "you do not have access"
    end
  end


end

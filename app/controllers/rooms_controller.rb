class RoomsController < ApplicationController
  before_action :ensure_private_users, only: [:show]
  def index
    @rooms = current_user.start_chatrooms +
             current_user.received_chatrooms

  end


  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.order(id: :desc).limit(500).reverse
    @message = Message.new

    if current_user == @room.user1
      @user = @room.user2
    else
      @user = @room.user1
    end

    if current_user.id = @room.user1_id
      @room.update_timestamp_user1
    end

    if current_user.id = @room.user2_id
      @room.update_timestamp_user2
    end

  end

  def create

    @room = find_room(params[:user1_id], params[:user2_id])

    if @room
       redirect_to room_path(@room.id)
    else
      @room = Room.new
      @room.user1_id = params[:user1_id]
      @room.user2_id = params[:user2_id]

      if @room.save
        redirect_to room_path(@room.id)
      else
        flash[:error] = @room.errors.full_messages.to_sentence
        redirct_to rooms_path
      end

    end

  end

  private

  def ensure_private_users
    room = Room.find(params[:id])
    if current_user.id != room.user1_id && current_user.id != room.user2_id
      redirect_to spaces_path
    end
  end

  def find_room(user1_id, user2_id)
    room ||= Room.where(user1_id:params[:user1_id],
                        user2_id:params[:user2_id]).first
    room ||= Room.where(user1_id:params[:user2_id],
                        user2_id:params[:user1_id]).first

    if room.blank?
      return false
    end

    return room
  end


end

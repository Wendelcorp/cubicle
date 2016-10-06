class RoomsController < ApplicationController
  def index
    @rooms = current_user.start_chatrooms +
             current_user.received_chatrooms

  end


  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.order(id: :desc).limit(500).reverse
    @message = Message.new
    @users = [@room.user1, @room.user2]
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

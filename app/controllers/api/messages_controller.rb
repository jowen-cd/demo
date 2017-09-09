module Api
  class MessagesController < BaseController
    before_action :load_users, only: [:index, :create]

    def index
      @messages = @user.messages_with(@friend)
      render json: @messages
    end

    def create
     message = @user.send_messages.new(another: @friend, content: params[:content])
     message.save
     render json: message
    end

    def read
      @user = User.find params[:user_id]
      message = @user.receive_messages.find params[:id]
      message.read!
      render json: message
    end

    def destroy
      message = SendMessage.find(params[:id])
      message.destroy
      head 204
    end

    private
    def load_users
      @user = User.find params[:user_id]
      @friend = User.find params[:friend_id] 
    end
  end
end

module Api
  class FriendshipsController < BaseController
    before_action :load_user, only: [:index, :create]

    def index
      @friendships = @user.friendships
      @friendships = @friendships.where(friend_id: params[:friend_id]) if params[:friend_id]
      render json: @friendships
    end

    def create
      @friend = User.find(params[:friend_id])
      friendship =  @user.friend_request(@friend)
      render json: friendship
    end

    def destroy
      friendship = Friendship.find params[:id]
      user_ids = friendship.attributes.values_at('user_id', 'friend_id')
      Friendship.where(user_id: user_ids, friend_id: user_ids).destroy_all
      head 204
    end

    private
    def load_user
      @user = User.find(params[:user_id])
    end
  end
end

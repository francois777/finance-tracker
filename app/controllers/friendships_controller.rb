class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.where(user: current_user)
  end

  def create
    friend = User.find(params['friend'])
    friendship = current_user.friends << friend
    flash[:notice] = "You are successfully following #{friend.full_name}."
    redirect_to friendships_path
  end

  def destroy
    friend = User.find(params['id'])
    friendship = Friendship.find_by(user: current_user, friend: friend)
    friendship.destroy
    flash[:notice] = "You have stopped following #{friend.full_name}"
    redirect_to friendships_path
  end
end

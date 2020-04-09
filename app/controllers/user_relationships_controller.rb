class UserRelationshipsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
    
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to @user
  end
  
  def destroy
    @user = UserRelationship.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to @user
  end
end
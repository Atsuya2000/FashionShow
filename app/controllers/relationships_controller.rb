class RelationshipsController < ApplicationController
  def follow
  current_user.follow(params[:id])
  redirect_to root_path
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to root_path
  end

  def followings
     user = User.find(params[:user_id])
     @users = user.followings
  end

  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end

end

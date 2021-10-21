class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def create
    current_user.follow(@user)
    redirect_to request.referrer, notice: "You started following the #{@user.username}"
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to request.referrer, notice: "You stopped following the #{@user.username}"
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
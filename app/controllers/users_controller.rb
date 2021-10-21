class UsersController < ApplicationController
  def index
    @users = User.all
    @users = if params[:search_by_username]
               User.search_by_username(params[:search_by_username])
             else
               User.all
             end
  end

  def show
    @user = User.find(params[:id])
  end
end

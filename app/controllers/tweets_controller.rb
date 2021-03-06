class TweetsController < ApplicationController
  before_action :set_tweet, only: [:destroy]
  before_action :authenticate_user!
  before_action :find_users

  def index
    @tweets = Tweet.all.order("created_at DESC")
    @tweet = Tweet.new
  end

  def create
    @tweets = Tweet.all.order("created_at DESC")
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet was successfully created.'
    else
      render :index
    end
  end

  def destroy
    @tweet.destroy
    redirect_to "/tweets", notice: 'Tweet was successfully destroyed.'
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:comment, :user_id)
    end

    def find_users
      @users = User.all
    end
end

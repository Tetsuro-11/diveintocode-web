class TweetsController < ApplicationController
  before_action :set_tweet, only:[:show, :edit, :update, :destroy]

  def index
    @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to new_tweet_path, notice:"Tweetを投稿しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path, notice: "Tweetを編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweetを削除しました。"
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
    
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end

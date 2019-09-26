class TweetsController < ApplicationController
  def index
    @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(blog_params)
    if @tweet.save
      redirect_to new_tweet_path, notice:"Tweetを投稿しました。"
    else
      render :new
    end
  end
  def show
    @tweet = Tweet.find(params[:id])
  end

  private
  def blog_params
    params.require(:tweet).permit(:content)
  end
end

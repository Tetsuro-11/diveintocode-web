class TweetsController < ApplicationController
  def index
    @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  def create
    Tweet.create(blog_params)
    redirect_to new_tweet_path
  end

  private
  def blog_params
    params.require(:tweet).permit(:content)
  end
end

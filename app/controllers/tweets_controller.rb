class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to tweets_path }
        format.js
      end
    else
      render 'new'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = 'Tweet deleted!'
    redirect_to tweets_path
  end

private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end

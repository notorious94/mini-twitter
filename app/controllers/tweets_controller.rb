class TweetsController < ApplicationController
  before_action :authenticate_user!, except: %w[index]
  before_action :set_tweet, only: %w[edit update destroy show]

  include ActionView::Helpers::NumberHelper

  def index
    @tweets = Tweet.all.order(id: :desc)
  end

  def latest_tweets
    following_user_ids = current_user.following.pluck(:id)
    @tweets = Tweet.where(creator_id: following_user_ids).order(id: :desc)
  end

  def new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      flash[:alert] = "Please review the following problems"
      render :edit
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    end
  end

  def show
  end

  def destroy
    begin
      if @tweet.destroy
        redirect_to tweets_path
      end
    rescue StandardError => e
      redirect_to fallback_location: root_path,
                  flash: { error: 'Operation could not be completed.' }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(
      :post
    )
  end

end

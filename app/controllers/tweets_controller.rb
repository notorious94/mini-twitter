class TweetsController < ApplicationController
  before_action :authenticate_user!, except: %w[index]
  before_action :set_tweet, only: %w[edit update destroy show]
  before_action :check_ownership, only: %w[edit update destroy]
  include ActionView::Helpers::NumberHelper

  def index
    @tweets = Tweet.all.order(id: :desc)
  end

  def latest_tweets
    following_user_ids = current_user.following.pluck(:id)
    @tweets = Tweet.where(creator_id: following_user_ids).order(id: :desc)
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      flash[:alert] = 'Please review the following problems'
      render :edit
    end
  end

  def edit; end

  def update
    redirect_to tweet_path(@tweet) if @tweet.update(tweet_params)
  end

  def show; end

  def destroy
    begin
      redirect_to tweets_path if @tweet.destroy
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
    params[:tweet][:post] = params[:tweet][:post].strip
    params.require(:tweet).permit(
      :post,
      :image
    )
  end

  def check_ownership
    if @tweet.creator.eql?(current_user)
      true
    else
      redirect_back fallback_location: root_path,
                    flash: { error: 'You are not eligible to make the changes.' }
    end
  end

end

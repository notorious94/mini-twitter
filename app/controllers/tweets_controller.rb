class TweetsController < ApplicationController
  before_action :authenticate_user!, except: %w[index show]
  before_action :set_tweet, only: %w[edit update destroy show]

  include ActionView::Helpers::NumberHelper

  def index
    @tweets = Tweet.all.order(id: :desc)
  end

  def like_tweet
    tweet = Tweet.find(params[:tweet_id])
    ActiveRecord::Base.transaction do
      unless Like.find_by(tweet_id: tweet.id, user_id: current_user.id).present?
        Like.create(tweet_id: tweet.id, user_id: current_user.id)
      end
      tweet.update_total_like_count
    end
    like_count = number_to_human(tweet.total_likes, format: '%n%u', precision: 2, units: { thousand: 'K', million: 'M', billion: 'B' })
    render json: like_count, adapter: nil
  end

  def unlike_tweet
    tweet = Tweet.find(params[:tweet_id])
    ActiveRecord::Base.transaction do
      Like.find_by(tweet_id: tweet.id, user_id: current_user.id).destroy
      tweet.update_total_like_count
    end
    like_count = number_to_human(tweet.total_likes, format: '%n%u', precision: 2, units: { thousand: 'K', million: 'M', billion: 'B' })
    render json: like_count, adapter: nil
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
      redirect_to tweets_path
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

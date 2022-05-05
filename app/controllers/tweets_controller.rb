class TweetsController < ApplicationController
  before_action :set_tweet, only: %w[edit update destroy show]

  def index
    @tweets = Tweet.all.order(id: :desc)
    @tweet = Tweet.new
  end

  def new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    end
  end

  def edit
  end

  def update
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

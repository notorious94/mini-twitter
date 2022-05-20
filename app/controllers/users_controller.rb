class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %w[show following_list followers_list]

  def suggested_followers; end

  def following_list; end

  def followers_list; end

  def show
    @own_tweets = @user.tweets.reverse
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end

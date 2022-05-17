class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = Like.create(like_params)
    @tweet = like.tweet
  end

  def destroy
    like = Like.find(params[:id])
    @tweet = like.tweet
    like.destroy
  end

  private

  def like_params
    params.require(:like).permit(
      :tweet_id,
      :user_id
    )
  end

end

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like, only: %(destroy)
  before_action :check_ownership, only: %(destroy)

  def create
    like = Like.create(like_params)
    @tweet = like.tweet
  end

  def destroy
    begin
      @tweet = @like.tweet
      @like.destroy
    rescue StandardError => e
      redirect_to root_path
    end
  end

  private

  def like_params
    params.require(:like).permit(
      :tweet_id,
      :user_id
    )
  end

  def set_like
    @like = Like.find(params[:id])
  end

  def check_ownership
    if @like.user.eql?(current_user)
      true
    else
      redirect_back fallback_location: root_path,
                    flash: { error: 'You are not eligible to make the changes.' }
    end
  end

end

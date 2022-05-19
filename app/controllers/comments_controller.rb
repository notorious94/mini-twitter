class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %(destroy)
  before_action :check_ownership, only: %(destroy)

  def create
    comment = Comment.new(comment_params)
    @tweet = if comment.save
               comment.tweet
             else
               Tweet.find(params[:comment][:tweet_id])
             end
  end

  def destroy
    begin
      @tweet = @comment.tweet
      @comment.destroy
    rescue StandardError => e
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :tweet_id,
      :user_id
    )
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_ownership
    if @comment.author.eql?(current_user)
      true
    else
      redirect_back fallback_location: root_path,
                    flash: { error: 'You are not eligible to make the changes.' }
    end
  end

end

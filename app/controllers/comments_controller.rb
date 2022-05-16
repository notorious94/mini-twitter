class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.create(comment_params)
    @tweet = comment.tweet
  end

  def destroy
    begin
      if @comment.destroy
        redirect_to root_path
      end
    rescue StandardError => e
      redirect_to fallback_location: root_path,
                  flash: { error: 'Operation could not be completed.' }
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

end

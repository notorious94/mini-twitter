class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    if comment.save
      @tweet = comment.tweet
    else
      @tweet = Tweet.find(params[:comment][:tweet_id])
    end
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
    params[:comment][:body] = params[:comment][:body].strip
    params.require(:comment).permit(
      :body,
      :tweet_id,
      :user_id
    )
  end

end

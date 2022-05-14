class CommentsController < ActionController::Base
  before_action :authenticate_user!

  def new
  end

  def create
    Comment.create(comment_params)
    redirect_back(fallback_location: root_path)
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

  def create_tweet_comment
    tweet = Tweet.find(params[:tweet_id])
    comment = ''
    ActiveRecord::Base.transaction do
      comment = Comment.create(tweet_id: params[:tweet_id],
                               user_id: params[:user_id],
                               body: params[:comment])
      tweet.update_total_comment_count
    end
    render json: comment, adapter: nil
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
      :comment,
      :tweet_id,
      :user_id
    )
  end

end
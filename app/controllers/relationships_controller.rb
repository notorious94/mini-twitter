class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    relationship = current_user.active_relationships.create(followed_id: params[:relationship][:followed_id])
    @followed = relationship.followed
    @target_user = User.find(params[:target_user_id]) if params[:target_user_id].present?
  end

  def destroy
    begin
      relationship = Relationship.find(params[:id])
      @target_user = User.find(params[:target_user_id]) if params[:target_user_id].present?
      relationship.destroy
    rescue StandardError => e
      redirect_to root_path
    end
  end

  def follow_user
    begin
      @followed_user = User.find(params[:followed_id])
      Relationship.create(follower: current_user, followed: @followed_user)
      redirect_to user_path(@followed_user)
    rescue StandardError => e
      redirect_to root_path
    end
  end

  def unfollow_user
    begin
      @followed_user = User.find(params[:followed_id])
      Relationship.find_by(follower: current_user, followed: @followed_user).destroy
      redirect_to user_path(@followed_user)
    rescue StandardError => e
      redirect_to root_path
    end
  end

end

class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    current_user.active_relationships.create(followed_id: params[:relationship][:followed_id])
    @target_user = User.find(params[:target_user_id]) if params[:target_user_id].present?
  end

  def destroy
    relationship = Relationship.find(params[:id])
    @target_user = User.find(params[:target_user_id]) if params[:target_user_id].present?
    relationship.destroy
  end
end
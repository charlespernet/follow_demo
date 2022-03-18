class FollowsController < ApplicationController
  before_action :find_followed_user

  def create
    current_user.follows.create(followed: @followed)

    render partial: 'users/user', locals: { user: @followed }
  end

  def destroy
    Follow.find_by(user: current_user, followed: @followed).destroy

    render partial: 'users/user', locals: { user: @followed }
  end

  private

  def find_followed_user
    @followed = User.find(params[:followed_id])
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user.update
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

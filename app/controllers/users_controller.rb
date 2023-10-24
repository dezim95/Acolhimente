class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to users_path
  end

  def select_role
    chose_volunteer = params[:chose_volunteer] == 'true'
    session[:chose_volunteer] = chose_volunteer

    if chose_volunteer
      redirect_to new_volunteer_registration_path
    else
      redirect_to new_user_registration_path
    end
  end


  def create
    super do |resource|
      if params[:user_role] == 'volunteer'
        resource.add_role(:volunteer)
      else
        resource.add_role(:user)
      end
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :age, :phone, :city, :state, :country, :address, :instagram, :profession, :professional_registration, :specialty, role_ids: [])
  end
end

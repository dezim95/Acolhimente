# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  def select_role
    chose_volunteer = params[:role_id] == Role.find_by(name: 'volunteer').id.to_s
    session[:chose_volunteer] = chose_volunteer
    redirect_to new_user_registration_path
  end
end

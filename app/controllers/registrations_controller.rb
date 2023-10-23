class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def select_role
    if params[:role_id].present?
      if params[:role_id] == Role.find_by(name: 'user').id
        redirect_to new_user_registration_path
      else
        redirect_to new_volunteer_registration_path
      end
    else
      # Handle when no role is selected
      # You can render an error message or take appropriate action
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :name, :age, :phone, :city, :state, :country, :address, :instagram, :role_id)
    end
  end

  def after_sign_up_path_for(resource)
    if resource.role?(:user)
      # Redirect to the user registration form
      new_user_registration_path
    else
      # Redirect to the volunteer registration form
      new_user_registration_path
    end
  end

end

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # POST /resource
  def create
    super
    resource.add_role(params[:user][:roles])
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :phone, :city, :state, :country, :address, :instagram, :profession, :professional_registration, :specialty, roles: []])
  end
end

class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    return edit_user_registration_path(@user)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end

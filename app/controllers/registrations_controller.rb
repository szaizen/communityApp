class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    profile_path
  end
end
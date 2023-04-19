class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_user!
    if user_signed_in?
      super
    elsif devise_controller? && (controller_name == 'registrations' || action_name == 'new')
      super
    else
      redirect_to new_user_registration_path
    end
  end
end

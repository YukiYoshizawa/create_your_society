class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def authenticate_admin!
  #   if !admin_signed_in?
  #     redirect_to new_user_session_path
  #   end
  # end

  # def after_sign_in_path_for(resource)
  #   if resource.is_a?(Admin)
  #     admin_path
  #   else
  #     root_path # 一般ユーザーの場合の遷移先を指定
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?


  # def authenticate_admin!
  #   if !admin_signed_in?
  #     redirect_to new_user_session_path
  #   end
  # end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    else
      users_my_page_path # 一般ユーザーの場合の遷移先を指定
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def storable_location?
    request.get? && !devise_controller? && !request.xhr? # 必要に応じて条件を調整してください。
  end

  def store_user_location!
    session[:user_return_to] = request.fullpath
  end

  def after_sign_in_path_for(resource)
      stored_location = session[:user_return_to]
      session[:user_return_to] = nil # リダイレクト後はセッションから削除
      stored_location || root_path # リダイレクト先がない場合はデフォルトのパスを使用
  end
end

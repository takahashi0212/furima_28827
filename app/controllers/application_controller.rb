class ApplicationController < ActionController::Base
 # before_action :basic_auth
  # before_action :authenticate_user!
  #protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #protected
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
  end
  
  # private

  #   def basic_auth
  #     authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
  #   end
end

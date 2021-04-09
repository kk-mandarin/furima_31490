class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
                                        keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana,
                                              :birthday])
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == 'kuma' && password == '0909'
    end
  end
end

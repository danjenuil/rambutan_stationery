class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def logged_in_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end

    def determine_transaction_type(stationery)
      if stationery.borrowable?
          "Borrow"
      elsif stationery.fixed?
          "Use"
      else
          "Take"
      end
    end
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end
  end
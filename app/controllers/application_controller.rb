class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  before_filter :user_serial, :authorize

  protected
  
    def user_serial

    	if params[:serial]
    	  u = User.find_by_password params[:serial]
    	  if u
    	    session[:user_id] = User.find_by_password( params[:serial] ).id
				end    	  
    	end
    end
    
    def authorize

      unless User.find_by_id( session[:user_id] )
        redirect_to login_url, :notice=>'Please log in'
      end
    end
  
end

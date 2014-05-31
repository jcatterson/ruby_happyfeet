class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  before_filter :user_serial, :authorize

  protected
  
    def user_serial

	    #print "Do I have any cookies?" << 
    	if cookies["serial"]#.to_s#params[:serial]
    	  u = User.find_by_serial cookies["serial"].to_s#params[:serial]
    	  if u
    	    @user = u
    	    print "it was found via serial" << @user.id
    	    session[:user_id] = @user.id
				end    	  
    	end
    end
    
    def authorize
			u = User.find_by_id( session[:user_id] )
      unless u
        redirect_to login_url, :notice=>'Please log in'
      end
      
    end
  
end

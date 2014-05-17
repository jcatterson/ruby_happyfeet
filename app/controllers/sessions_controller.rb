class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
    #redirect_to store_url
  end

  def create
    if user = User.authenticate( params[:name], params[:password] )
      session[:user_id] = user.id
      redirect_to coaches_url
    else
      redirect_to login_url, :alert =>'Invalid user/password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice=>'Logged out'
  end
end

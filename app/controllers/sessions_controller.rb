class SessionsController < ApplicationController
  skip_before_filter :authorize

   def new
     respond_to do |format|
       format.html
       format.json { render :json => "Please Log on" }
     end
   end

  def create
    if user = User.authenticate( params[:name], params[:password] )
      session[:user_id] = user.id
      cookies[:serial] = user.password
      redirect_to coaches_url
    else
      session[:user_id] = nil
      redirect_to login_url, :alert =>'Invalid user/password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice=>'Logged out'
  end
end

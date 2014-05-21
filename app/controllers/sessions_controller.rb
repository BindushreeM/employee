class SessionsController < ApplicationController
  respond_to :html, :js

  def new
    respond_to do |format|
    format.js { render 'new'}
  end
  end

  def create
    if params[:provider]
      user = User.from_omniauth(env["omniauth.auth"]) 
    else
      user = User.authenticate(params[:email], params[:password])
    end 
    if user
      session[:user_id] = user.id
      redirect_to employees_path, :notice => "Logged In!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out successfully!"
  end
end

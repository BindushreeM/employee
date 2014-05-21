class UsersController < ApplicationController
   respond_to :html, :js
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       session[:user_id] = @user.id
       redirect_to employees_path, :notice => "Signed Up!"
    else
      render "new"
    end
  end
   
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone_number,:address)
  end
  
end
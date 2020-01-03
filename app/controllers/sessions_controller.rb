class SessionsController < ApplicationController
  def new
    flash_message = "Whoops, looks like you're already logged in!"
    if user_role("default")
      redirect_to "/profile"
      flash[:success] = flash_message
    elsif user_role("merchant")
      redirect_to "/merchants/dashboard"
      flash[:success] = flash_message
    elsif user_role("admin")
      redirect_to "/admin/dashboard"
      flash[:success] = flash_message
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.default? 
        redirect_to "/profile"
        flash[:success] = "Welcome, #{user.name}. You have been successfully logged in."
      elsif user.merchant?
        redirect_to "/merchants/dashboard"
        flash[:success] = "Welcome, #{user.name}. You have been successfully logged in as a Merchant."
      elsif user.admin?
        redirect_to "/admin/dashboard"
        flash[:success] = "Welcome, #{user.name}. You have been successfully logged in as an Admin."
      else
        redirect_to "/login"
        flash[:error] = "Oops. Something went wrong."
      end
    else
      flash.now[:notice] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = "You have been successfully logged out."
    redirect_to "/"
  end

end
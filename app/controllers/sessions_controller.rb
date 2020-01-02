class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}. You have been successfully logged in."
      if user.default? 
        redirect_to "/profile"
      elsif user.merchant?
        redirect_to "admins/dashboard"
      elsif user.admin?
        redirect_to "merchants/dashboard"
      else
        redirect_to "/login"
        flash[:error] = "Oops. Something went wrong."
      end
    else
      flash.now[:notice] = "Invalid email or password."
      render :new
    end
  end
end
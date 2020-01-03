class UsersController < ApplicationController
  def index

  end

  def new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      session[:user_id] = @new_user.id
      flash[:success] = "Successfully registered and logged in"
      redirect_to "/profile"
    else
      flash[:error] = "Please fill in all the fields"
      render :new
    end
  end

  private
    def user_params
      params.permit(
        :name,
        :street_address,
        :city,
        :state,
        :zip_code,
        :email,
        :password,
        :password_confirmation
      )
    end
end
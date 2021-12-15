class UsersController < ApplicationController

  def show
    @facade = UserFacade.new(User.find(params[:id]))
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_path(user)
    elsif
      password_check
    else
      flash[:alert] = "Could not create user"
      redirect_to new_user_path
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      flash[:success] = "Welcome back #{user.name}"
      redirect_to "/users/#{user.id}"
    else
      flash[:alert] = "Sorry, your password didn't match"
      render :login_form
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def password_check
    if params[:password] != params[:password_confirmation]
      flash[:alert] = "Password and Password Confirmation did not match. Please try again"
      redirect_to new_user_path      
    end
  end
end

class UsersController < BaseController
  before_action :require_user, only: [:show]

  def show
    @facade = UserFacade.new(User.find(session[:user_id]))
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    elsif params[:password] != params[:password_confirmation]
      password_failure
    else
      flash[:alert] = "Could not create user"
      redirect_to new_user_path
    end
  end

  def discover
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def password_failure
    flash[:alert] = "Password and Password Confirmation did not match. Please try again"
    redirect_to new_user_path
  end
end

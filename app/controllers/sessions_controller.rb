class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.name}"
      redirect_to "/users/#{user.id}"
    else
      flash[:alert] = "Sorry, your password didn't match"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end

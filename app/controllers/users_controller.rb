class UsersController < ApplicationController

  def show
  end

  def new
  end

  def create
  end

  def movie
  end

  def discover
    @user = User.find(params[:id])
  end
end

class BaseController < ApplicationController
  def require_user
    if !current_user
      flash[:alert] = "You must be registered and logged in to use this feature"
      redirect_to root_path
    end
  end
end

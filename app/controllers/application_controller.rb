class ApplicationController < ActionController::Base
  before_action :api_call
  def api_call
    @films = MovieFacade.new
  end
end

class ApplicationController < ActionController::Base

  helper :all
  helper_method :redirect_back_or
  protect_from_forgery
  
  def redirect_back_or(path)
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to path
  end
end

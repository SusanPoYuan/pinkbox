class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_admin
  	if !current_user.admin?
  		redirect_to mainpage_path
  	end
  end
end

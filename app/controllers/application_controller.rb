class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :new_user
  helper_method :admin

  # Who is currently logged in, if anyone
  def current_user
  	if session[:user_id]
  		User.find_by(id: session[:user_id])
    end
  end

  def new_user
    new_user = !current_user
  end

  def admin
    User.find_by admin:true
  end

end

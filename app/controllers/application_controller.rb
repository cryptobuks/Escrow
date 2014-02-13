class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :new_user

  # Who is currently logged in, if anyone
  def current_user
  	if session[:user_id]
  		User.find_by(id: session[:user_id])
    end
  end

  def new_user
    new_user = !current_user
  end

  def bigbossman
      bigbossman = (User.find("52f579904a6179ea18060000") && current_user) &&
      !new_user || ((User.find("52f579904a6179ea18060000")) && current_user)
  end


end

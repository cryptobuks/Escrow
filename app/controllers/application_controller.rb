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

  def login_required 
    unless current_user
      session[:redirect] = request.url
      redirect_to new_auth_path
    end
  end

end

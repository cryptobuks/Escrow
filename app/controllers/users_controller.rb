class UsersController < ApplicationController
  
  def index
  	@users = User.all
  end

  def show
  	@show = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	User.create(params[:user].permit(:firstname, :lastname, :email, :username, :password, :phonenumber))
    redirect_to users_path
  end

end
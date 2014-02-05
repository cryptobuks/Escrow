class UsersController < ApplicationController
  
  def index
  	@users = User.all
  end

  def show
  	@show = User.find(params[:id])

  def new
  	@user = User.new
  end

  def create
  	User.create(params[:user].permit(:firstname, :lastname, :email, :username, :phonenumber))
  end

end

# field :firstname, type: String
#   field :lastname, type: String
#   field :email, type: String
#   field :username, type: String
#   field :salt, type: String
#   field :hashed_password, type: String
#   field :phonenumber, type: String
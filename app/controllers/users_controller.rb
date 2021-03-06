class UsersController < ApplicationController

  before_action :login_required, except: [:new, :create]

  def index
      @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

  def new
      @user = User.new
  end

  def create
      if User.create(user_params)
        redirect_to covers_path
        flash[:notice] = "successfully created user!"
      else
        render action: 'new'
      end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])

    if @user.update user_params
      flash[:notice] = "Successfully updated user!"
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def destroy
    u = User.find(params[:id])
    u.destroy
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password, :twilio_number, :twilio_sid, :twilio_token, :admin)
  end

end
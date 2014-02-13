class UsersController < ApplicationController

  def index
    if admin
      @users = User.all
    else !admin
      redirect_to covers_path
    end
  end

  def show
    if admin
      @user = User.find(params[:id])
    else
      redirect_to covers_path
    end
  end

  def new
    if admin
      @user = User.new
    else
      redirect_to covers_path
    end
  end

  def create
    if admin
      if User.create(user_params)
        redirect_to action: 'index'
        flash[:notice] = "successfully created user!"
      else
        render action: 'new'
      end
    else
    end
  end

  def edit
    if admin
      @user = User.find(params[:id])
    else
    end
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
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password, :phonenumber, :admin)
  end

end
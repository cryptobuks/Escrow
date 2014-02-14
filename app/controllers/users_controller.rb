class UsersController < ApplicationController

  def index
<<<<<<< HEAD
      @users = User.all
=======
    if admin
      @users = User.all
    else !admin
      redirect_to covers_path
    end
>>>>>>> f58f690bdc977c8c9c44778836f79542e0f7b354
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
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    get_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created"
      redirect_to @user
    else
      flash.new[:message] = "Error create user"
      render :new
    end
  end

  def edit
    get_user
  end

  def update
    get_user
    if @user.update_attributes(user_params)
      flash[:notice] = "User updated"
      redirect_to @user
    else
      flash.now[:message] = "User update error"
      render :edit
    end
  end

  private
  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end

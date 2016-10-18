class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = "subscriber"
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @boxes = @user.boxes
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.role = "subscriber"
    if @user.save
      redirect_to subscriptions_path, :notice => "Subscription Successful!"
    else
      render 'edit'
    end
  end



  private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :username, :subscription_id, :role)
    end
end

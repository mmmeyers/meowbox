class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @boxes = @user.boxes
  end

  def edit
    @user = User.find(params[:id])
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


  private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :username, :subscription_id, :role)
    end
end

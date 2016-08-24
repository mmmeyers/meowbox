class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end


  private
    def user_params
      params.require(:user).permit(:username, :email, :first_name, :last_name)
    end
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new users_params
    if @user.save
      redirect_to root_url, notice: 'Logged in!'
    else
      render 'new'
    end
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

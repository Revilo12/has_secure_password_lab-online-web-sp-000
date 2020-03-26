class UsersController < ApplicationController

  def new
  end

  def create
    if passwords_match?
      @user = User.create(user_params)
      login(@user)
    else
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require('user').permit(:name, :password, :password_confirmation)
  end

  def passwords_match?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end

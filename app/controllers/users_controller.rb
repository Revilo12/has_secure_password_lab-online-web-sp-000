class UsersController < ApplicationController
  def create
    @user = User.create(params[:user])
  end

  private

  def user_params
    params.require('user').permit(:name, :password, :password_confirmation)
end

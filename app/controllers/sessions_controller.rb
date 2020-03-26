class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end

  def destroy
    session.clear
  end
end

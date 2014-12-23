class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      redirect_to :root
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login' , notice: 'Successfully logged out'
  end
end
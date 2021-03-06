class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_for_login
    if session[:user_id] == nil
      redirect_to login_path
    end
  end

  def throw_404
    render file: "#{Rails.root}/public/404.html", status: 404, layout: true
  end
end

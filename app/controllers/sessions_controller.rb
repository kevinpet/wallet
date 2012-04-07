class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login].downcase, params[:password])
    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete :auth_token
    redirect_to root_url, :notice => "You have been logged out."
  end
end

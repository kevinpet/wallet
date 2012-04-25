class WelcomeController < ApplicationController
  def home
    if logged_in?
      redirect_to ng_ui_path
    end
  end

  def about
  end

end

class WelcomeController < ApplicationController
  def home
    if logged_in?
      redirect_to wallets_path
    end
  end

  def about
  end

end

class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
    if (request.xhr?)
      render :json => @wallets
      return
    end
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  def new
    @wallet = Wallet.new
  end

  def create
    @wallet = Wallet.new(params[:wallet])
    if @wallet.save
      if request.xhr?
        render :json => @wallet
      else
        redirect_to @wallet, :notice => "Successfully created wallet."
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @wallet = Wallet.find(params[:id])
  end

  def update
    @wallet = Wallet.find(params[:id])
    if @wallet.update_attributes(params[:wallet])
      redirect_to @wallet, :notice  => "Successfully updated wallet."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @wallet = Wallet.find(params[:id])
    @wallet.destroy
    redirect_to wallets_url, :notice => "Successfully destroyed wallet."
  end
end

class WalletsController < ApplicationController
  before_filter :intercept_html_requests, :except => [:new, :edit]
  layout nil
  respond_to :json
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
    render 'edit_dialog', :layout => false
  end

  def create
    if params[:wallet][:id]
      raise "Wallet already has id, but calling create!"
    end
    @wallet = Wallet.new(params[:wallet])
    @wallet.save
    render :json => @wallet
  end

  def edit
    render 'edit_dialog', :layout => false
  end

  def update
    params[:wallet].delete(:id)
    @wallet = Wallet.find(params[:id])
    @wallet.update_attributes(params[:wallet])
    render :json => @wallet
  end

  def destroy
    @wallet = Wallet.find(params[:id])
    @wallet.destroy
    render :nothing => true
  end

  private
  def intercept_html_requests
    render 'dynamic' if request.format == Mime::HTML
  end

  def handle_unverified_request
    # reset_session
    # render "#{Rails.root}/public/500.html", :status => 500, :layout => nil
  end

end

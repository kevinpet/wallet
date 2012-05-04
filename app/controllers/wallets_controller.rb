class WalletsController < ApplicationController
  before_filter :login_required
  before_filter :own_wallet, :only => [:show, :edit, :destroy]

  layout nil
  respond_to :json, :html
  def index
    @wallets = current_user.wallets
    if (request.xhr?)
      render :json => @wallets
      return
    end
    if (request.format == :json)
      send_data @wallets.to_json, :filename => "backup.json"
      return
    end
  end

  def show
    @wallet = Wallet.find(params[:id])
    if (request.xhr?)
      render :json => @wallet
      return
    end
    if (request.format == :json)
      send_data @wallet.to_json, :filename => @wallet.filename
      return
    end
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
    pocket = Pocket.new user: current_user, wallet: @wallet, access: :rw
    pocket.save
    render :json => @wallet
  end

  def edit
  end

  def update
    params[:wallet].delete(:id)
    @wallet.update_attributes(params[:wallet])
    render :json => @wallet
  end

  def destroy
    wallet = Wallet.find(params[:id])
    pocket = Pocket.where({user_id: current_user.id, wallet_id: wallet.id}).first
    if (pocket)
      pocket.destroy
      if wallet.pockets.empty?
        wallet.destroy
      end
    end
    render :nothing => true
  end

  private
  def handle_unverified_request
    reset_session
    render "#{Rails.root}/public/500.html", :status => 500, :layout => nil
  end

  def own_wallet
    wallet = Wallet.find(params[:id])
    if wallet.pockets.select { |p| p.user == current_user }.empty?
      raise "permission denied"
    else
      @wallet = wallet
    end
  end

end

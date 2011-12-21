class PocketsController < ApplicationController

  before_filter :admin_required

  def index
    @pockets = current_user.pockets
  end

  def show
    pocket = Pocket.find(params[:id])
    if pocket.user == current_user
      @pocket = pocket
    else
      @pocket = nil
    end
  end

  def new
    @pocket = Pocket.new
  end

  def create
    @pocket = Pocket.new(params[:pocket])
    if @pocket.save
      redirect_to @pocket, :notice => "Successfully created pocket."
    else
      render :action => 'new'
    end
  end

  def edit
    @pocket = Pocket.find(params[:id])
  end

  def update
    @pocket = Pocket.find(params[:id])
    if @pocket.update_attributes(params[:pocket])
      redirect_to @pocket, :notice  => "Successfully updated pocket."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @pocket = Pocket.find(params[:id])
    @pocket.destroy
    redirect_to pockets_url, :notice => "Successfully destroyed pocket."
  end
end

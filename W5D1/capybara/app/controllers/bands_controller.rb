class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(user_params)
    if @band.save
      redirect_to bands_url
    end
  end

  def edit
    @band = Band.find_by(params[:id])
    render :edit
  end

  def destroy
    
  end

  def user_params
    params.require(:band).permit(:name)
  end
end

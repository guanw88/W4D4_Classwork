class BandsController < ApplicationController
  before_action :redirect_to_signup_if_not_logged_in
  
  def index #show all bands
    render :index
  end

  def create #create new band
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new #show create new band page
    render :new
  end

  def edit #show edit band page
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def show #show individual band page
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update #update existing band
    @band = Band.find_by(id: params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy #delete band
    @band = Band.find_by(id: params[:id])
    @band.destroy if @band
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end

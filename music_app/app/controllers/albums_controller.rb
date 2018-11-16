class AlbumsController < ApplicationController
  before_action :redirect_to_signup_if_not_logged_in

  def create #create new album
    @album = Album.new(album_params)
    band = @album.band
    if @album.save!
      redirect_to band_url(band)
    else
      flash[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def new #show create new album page
    render :new
  end

  def edit #show edit album page
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def show #show individual album page
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def update #update existing album
    @album = Album.find_by(id: params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy #delete album
    @album = Album.find_by(id: params[:id])
    band = @album.band
    @album.destroy if @album
    redirect_to band_url(band)
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :band_id, :live_album)
  end

end

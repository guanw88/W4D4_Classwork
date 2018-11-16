class TracksController < ApplicationController
  before_action :redirect_to_signup_if_not_logged_in

  def create #create new track
    @track = Track.new(track_params)
    album = @track.album
    if @track.save!
      redirect_to album_url(album)
    else
      flash[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def new #show create new track page
    render :new
  end

  def edit #show edit track page
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def show #show individual track page
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def update #update existing track
    @track = Track.find_by(id: params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy #delete track
    @track = Track.find_by(id: params[:id])
    album = @track.album
    @track.destroy if @track
    redirect_to album_url(album)
  end

  private
  def track_params
    params.require(:track).permit(:title, :ord, :lyrics, :regular_track, :album_id)
  end

end

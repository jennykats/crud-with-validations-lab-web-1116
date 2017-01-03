class SongsController < ApplicationController

  def show
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  def edit
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.valid?
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to @song
    else
    render :new
    end   
  end

  private

  def song_params
    params.require(:song).permit(:release_year, :title, :artist_name, :genre, :released)
  end

end

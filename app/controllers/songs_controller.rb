class SongsController < ApplicationController

  def index
    @songs = Song.all 
  end

  def new
    @song = Song.new 
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    set_song 
  end

  def edit
    set_song 
  end

  def update
  end

  def destroy
  end

  private

  def set_song
    @song = Song.find_by(id: params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end

end

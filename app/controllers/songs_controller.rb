class SongsController < ApplicationController
  def edit
    @song = Song.find_by(id: params[:id])
  end
  def

  def index
    @songs=Song.all
  end

  def new
    @song= Song.new
  end
end

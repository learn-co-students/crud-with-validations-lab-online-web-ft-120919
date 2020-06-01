class SongsController < ApplicationController

    def index
        @songs = Song.all 
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.create(song_params)
        # binding.pry
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
                render :new
            end
    end

private

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end

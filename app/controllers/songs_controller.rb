class SongsController < ApplicationController
    before_action :set_song!, only: [:show, :edit, :update]

    def index
        @songs = Song.all
    end

    def show
    end
    
    def new
        @song = Song.new
    end

    def edit
    end

    def create
        @song = Song.new(song_params(:title, :artist_name, :released, :release_year, :genre))
        # binding.pry
        if @song.valid?
          @song.save
          redirect_to song_path(@song)
        else
          render :new
        end
    end

    def update
        @song.update(song_params)
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end

    private

    # def song_params
    #     params.permit(:title, :released, :release_year, :artist_name, :genre)
    # end

    def set_song!
        @song = Song.find(params[:id])
    end

    def song_params(*args)
        params.permit(*args)
    end
end

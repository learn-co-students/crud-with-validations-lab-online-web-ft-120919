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
        @song = Song.create(song_params)
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

    def delete
    end

    private

    def song_params
        params.permit(:title, :released, :release_year, :artist_name, :genre)
      end

    def set_song!
        @song = Song.find(params[:id])
    end

    # def song_params(*args)
    #     params.permit(*args)
    # end
end

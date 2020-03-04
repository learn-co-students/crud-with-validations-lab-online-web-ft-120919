class SongsController < ApplicationController
    before_action :set_song!, only: [:show, :edit, :update, :destroy]

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)

        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def index
        @songs = Song.all
    end

    def show
        
    end

    def edit

    end

    def update
        song_params.each_pair do |key, value|
            @song[key] = value
        end

        if @song.valid?
            Song.find(params[:id]).update(song_params)
            redirect_to song_path(params[:id])
        else
            render :edit
        end
    end

    def destroy
        @song.delete
        redirect_to songs_path
    end

    private
        def song_params
            params.require(:song).permit(:title, :released, :artist_name, :genre, :release_year)
        end

        def set_song!
            @song = Song.find(params[:id])
        end
end

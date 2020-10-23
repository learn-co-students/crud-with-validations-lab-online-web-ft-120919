class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end


    private

    def song_params
        params.require(@song)
    end
end

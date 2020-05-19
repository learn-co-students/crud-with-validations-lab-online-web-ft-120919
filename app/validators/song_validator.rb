class SongValidator < ActiveModel::Validator
    def validate(record)

        if Song.find_by(artist_name: record.artist_name, title: record.title, release_year: record.release_year)
            record.errors[:song] << "One artist can't release the same song twice in one year!"
        end

    end
end
class SongValidator < ActiveModel::Validator
  def validate(song)
    Song.all.reject{ |other_song| other_song.id == song.id }.each do |other_song|
      if song.title == other_song.title && song.release_year == other_song.release_year
        song.errors[:title] << "cannot be identical to title of other song from same year"
      end
    end
  end
end
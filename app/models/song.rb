class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {
        scope: [:release_year, :artist_name],
        message: "can't release same song in the same year from the same artist"
    }
    
    validates :release_year, presence: true,
        if: :released?, presence: true

    validate :no_future_song

    def no_future_song
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release year can't be in the future")
        
        end
    end

end

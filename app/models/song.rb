class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Cannot release the same song twice in a year."}
    validates :released, inclusion: {in: [true, false]}
    validate :release_year_presence
    validates :artist_name, presence: true

    def release_year_presence
        if self.released
            unless self.release_year
                errors.add(:release_year, "Released Song must have a released year.")
            else
                present = Time.new
                if present.year < self.release_year
                    errors.add(:release_year, "Can't release a song in the future.")
                end
            end
        end
    end
end

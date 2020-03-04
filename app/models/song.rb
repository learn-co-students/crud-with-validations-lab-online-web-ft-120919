class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, if: :song_released?, numericality: {less_than_or_equal_to: 2020}
    validates :artist_name, presence: true
    validate :rereleased?
    
    def song_released?
        self.released
    end

    def rereleased?
        errors.add(:release_year, "Cannot release twice in one year") if self.class.find_by(title: self.title, release_year: self.release_year)
    end
end

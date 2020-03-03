class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validate :no_duplicated_title
  validate :invalid_date
  
  def no_duplicated_title
    if Song.any? do |s| 
      s.title == title && s.artist_name == artist_name && s.release_year == release_year
    end
    errors.add(:title, "You've already named a song with this title.")
    end
  end

  def invalid_date
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "That's not the current year. You cannot release for the future.")
    end
  end
end



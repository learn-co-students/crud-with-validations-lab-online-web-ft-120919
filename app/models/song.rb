class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true

  validate :title_artist_year_validation
  validate :release_year_validation

  def title_artist_year_validation
    # title cannot be repeated by the same artist in the same year
    #binding.pry
    song = Song.find_by title: title , artist_name: artist_name,  release_year: release_year
    if !song==nil
      errors.add(:title, "Title cannot be repeated by the same artist in the same year")
    end
  end


=begin
     Optional if released is false
     Must not be blank if released is true
     Must be less than or equal to the current year
=end
  def release_year_validation
    if(released)
      if release_year==nil
        errors.add(:release_year, "Release Year required for released songs.")
      else
        if release_year >(Date.today.year)
          errors.add(:release_year, "Release Year must NOT be >=  current year")
        end
      end
    end
  end


end

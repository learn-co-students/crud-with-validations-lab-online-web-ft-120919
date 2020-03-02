require 'date'

class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :year, message: "should happen once per year" }
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true if :released == true
    # validates :release_year, year is less than or equal to current year
    validate :date_must_be_in_the_past
    validates :artist_name, presence: true

 
  def date_must_be_in_the_past
    if release_year.present? && release_year > Date.today.year
      errors.add(:expiration_date, "can't be in the future")
    end
  end

end

require 'date'

class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year, message: "should happen once per year" }
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true, if: :released_is_true
    validate :date_must_be_in_the_past
    validates :artist_name, presence: true

 
  def date_must_be_in_the_past
    if release_year.present? && release_year > Date.today.year
      errors.add(:expiration_date, "can't be in the future")
    end
  end

  def released_is_true
    released == true
  end

end

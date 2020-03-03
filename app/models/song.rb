class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false], message: "must be true or false" }
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year, message: "cannot be in the future" }, if: :released?

  def released?
    released
  end
end

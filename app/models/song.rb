class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :year, message: "should happen once per year" }
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true if :released == true
    # validates :release_year, year is less than or equal to current year
    validates :artist_name, presence: true
end

class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :release_year}
    validates :released, inclusion: {in: [true, false]}, acceptance: true 
    validates :artist_name, presence: true 
end

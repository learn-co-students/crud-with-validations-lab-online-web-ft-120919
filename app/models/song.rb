class Song < ApplicationRecord
    include ActiveModel::Validations 
    validates :title, presence: true, uniqueness: {scope: :release_year}
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true 
    validates_with SongValidator

end

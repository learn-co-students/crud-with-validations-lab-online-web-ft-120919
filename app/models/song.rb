class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with SongValidator
    validates :title, presence: true
    validates :release_year, numericality: { less_than_or_equal_to: (Time.now.year) }, if: :released?
    
    
end

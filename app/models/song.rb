class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true
  validates_with SongValidator
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
end

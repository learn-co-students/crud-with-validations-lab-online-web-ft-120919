class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :release_year, numericality: { less_than_or_equal_to: 2020 }, if: :released?
    validates_presence_of :release_year, if: :released?
    validates :artist_name, presence: true
  end
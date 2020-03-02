class Song < ApplicationRecord
  #validates :title, presence: true 
  validates :title, {presence: true, uniqueness: {scope: [:artist_name, :release_year]}}
  validates :released, inclusion: {in: [true, false]}

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {only_integer: true, less_than: 2020}
  end

  validates :artist_name, presence: true
end

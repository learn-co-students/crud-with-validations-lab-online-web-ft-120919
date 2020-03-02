class Song < ApplicationRecord
  validates :title, presence: true 
  #validates :title, {presence: true, uniqueness: {scope: {:artist, :year}}}
  validates :released, inclusion: {in: [true, false]}
  #validates :release_year, presence: true, if: released?, numericality: {only_integer: true, less_than: 2020}
  validates :artist_name, presence: true
end

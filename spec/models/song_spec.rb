require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:valid_attributes) do
    {
      title: "Parachutes",
      artist_name: "Balance and Composure",
      release_year: 2015,
      released: true,
      genre: "Post hardcore"
    }
  end


end

require 'rails_helper'

RSpec.describe Movie do
  it 'has attributes' do
    movie = Movie.new(movie_data)

    expect(movie.id).to eq(75)
    expect(movie.title).to eq("Mars Attacks!")
    expect(movie.rating).to eq(6.4)
  end
end

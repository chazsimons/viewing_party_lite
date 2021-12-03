require 'rails_helper'

RSpec.describe CastMember do
  it 'has attributes' do
    cast = CastMember.new(cast_data)

    expect(cast.name).to eq("Jack Nicholson")
    expect(cast.character).to eq("President James Dale / Art Land")
  end
end

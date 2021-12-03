require 'rails_helper'

RSpec.describe UserFacade do
  before :each do
    @user= create(:user)
    @party = create(:party, creator_id: @user.id)
    UserParty.create!(user: @user, party: @party)
    @facade = UserFacade.new(@user)
  end

  describe '#host' do
    it 'returns the host of a party' do
      expect(@facade.host(@party)).to eq @user.name
    end
  end
end

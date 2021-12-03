require 'rails_helper'

RSpec.describe UserFacade do
  before :each do
    @user_1 = create(:user)
    @facade = UserFacade.new(@user_1.id)
  end

end

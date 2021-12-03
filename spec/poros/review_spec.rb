require 'rails_helper'

RSpec.describe Review do
  it 'has attributes' do
    review = Review.new(review_data)

    expect(review.author).to eq('Kamurai')
    expect(review.content).to eq("Good watch, could watch again, but it's hard to honestly recommend.\r\n\r\nThis is one of those movies that is good because it is bad, whether or not that is done on purpose, for the purposes of parody.  Otherwise it's just a good old jump in \"The Way Back Machine\" to see a litany of cameos or cheap parts by almost anyone who was famous in the mid-1990s.  Though I do feel like most of the actors I liked were essentially wasted, but it is possible that was by design so the Martians could keep the focus for the majority of the movie.\r\n\r\nRethinking on the movie almost makes me want a modernization, it has so many little quirks and nuances that really brings it to a special experience.  Even if you think it looks terrible, throw this on your queque and slot it in for a Bad Movie Night.")
  end
end

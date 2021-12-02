class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  validates_presence_of :start_time, :length
end

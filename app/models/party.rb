class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  validates_presence_of :start_time, :length
  validates_numericality_of :length, :greater_than_or_equal_to => :runtime
end

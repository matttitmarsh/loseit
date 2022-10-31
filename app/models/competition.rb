class Competition < ApplicationRecord
  has_many :competitors
  has_many :users, through: :competitions
end

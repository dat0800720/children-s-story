class Reviewtale < ApplicationRecord
  belongs_to :tale
  belongs_to :user
  validates :rating, presence: true
end

class Category < ApplicationRecord
  has_many :tales
  validates :name, presence: true, length: { maximum:100 }
end

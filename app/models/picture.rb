class Picture < ApplicationRecord
  belongs_to :tale
  has_one_attached :image
end

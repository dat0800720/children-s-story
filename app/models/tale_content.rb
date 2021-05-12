class TaleContent < ApplicationRecord
  belongs_to :tale
  has_one_attached :image
  has_one_attached :audio
  enum content_type: [:text, :void, :image]
end

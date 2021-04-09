class Tale < ApplicationRecord
  belongs_to :category
  has_many :figures
  accepts_nested_attributes_for :figures, allow_destroy: true
  has_one_attached :image
  validates :image,content_type: { in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format" },
    size:{ less_than: 5.megabytes,message: "should be less than 5MB" }
end

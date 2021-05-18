class Tale < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :tale_contents, dependent: :destroy
  accepts_nested_attributes_for :tale_contents, allow_destroy: true
  has_many :passive_relationships, class_name: "Relationship",
                                 foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  
  validates :image,content_type: { in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format" },
    size:{ less_than: 5.megabytes,message: "should be less than 5MB" }
  
end

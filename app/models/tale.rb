class Tale < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :tale_contents, dependent: :destroy
  accepts_nested_attributes_for :tale_contents, allow_destroy: true
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  
  has_many :reviewtales , class_name: "Reviewtale",
    foreign_key: "tale_id", dependent: :destroy
  has_many :users, through: :reviewtales, source: :tale_id
  
  validates :image,content_type: { in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format" },
    size:{ less_than: 5.megabytes,message: "should be less than 5MB" }
  
end

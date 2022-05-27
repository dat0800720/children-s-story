class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :new_user_month_now, -> { where('DATE(created_at) >= ? AND DATE(created_at) < ?', Time.current.beginning_of_month, Time.current.beginning_of_month + 1.month) }
  scope :new_user_last_month, -> { where('DATE(created_at) >= ? AND DATE(created_at) < ?', Time.current.beginning_of_month - 1.month, Time.current.beginning_of_month) }
  scope :new_user_two_month_ago, -> { where('DATE(created_at) >= ? AND DATE(created_at) < ?', Time.current.beginning_of_month - 2.months, Time.current.beginning_of_month - 1.month) }
  scope :new_user_three_month_ago, -> { where('DATE(created_at) >= ? AND DATE(created_at) < ?', Time.current.beginning_of_month - 3.months, Time.current.beginning_of_month - 2.months) }
  has_one :request, dependent: :destroy
  has_many :tales, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', inverse_of: :follower,
                                  foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :reviewtales, class_name: 'Reviewtale', dependent: :destroy

  has_many :active_favourites, class_name: 'Favourite', inverse_of: :favouriter,
                               foreign_key: 'favouriter_id', dependent: :destroy
  has_many :favouriting, through: :active_favourites, source: :favourited

  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  # has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end

  def follow(tale)
    Relationship.find_or_create_by! follower_id: id, followed_id: tale.id
  end

  def unfollow(tale)
    Relationship.find_by(follower_id: id, followed_id: tale.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(tale)
    following.include?(tale)
  end

  def favourite(tale)
    Favourite.find_or_create_by! favouriter_id: id, favourited_id: tale.id
  end

  def unfavourite(tale)
    Favourite.find_by(favouriter_id: id, favourited_id: tale.id).destroy
  end

  # Returns true if the current user is following the other user.
  def favouriting?(tale)
    favouriting.include?(tale)
  end
end

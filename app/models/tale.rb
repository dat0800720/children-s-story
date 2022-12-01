class Tale < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :author, optional: true
  has_one_attached :image
  scope :views_rating_by_day, -> { order(view: :desc) }
  scope :order_by_id, -> { order(id: :desc) }
  scope :sort_by_follow, -> { sort_by { |tale| tale.followers.size }.reverse }
  scope :sort_by_favourite, -> { sort_by { |tale| tale.favouriters.size }.reverse }
  has_many :tale_contents, dependent: :destroy
  accepts_nested_attributes_for :tale_contents, allow_destroy: true
  has_many :passive_relationships, class_name: 'Relationship', inverse_of: :followed,
                                   foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :reviewtales, class_name: 'Reviewtale', dependent: :destroy
  has_many :users, through: :reviewtales, source: :tale_id

  has_many :passive_favourites, class_name: 'Favourite', inverse_of: :favourited,
                                foreign_key: 'favourited_id', dependent: :destroy
  has_many :favouriters, through: :passive_favourites, source: :favouriter

  enum status: { approved: 0, waiting_censorship: 1, refused: 2 }

  # comment khi chay seed
  # validates :image, presence: true
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: I18n.t('errors.must_be_a_valid_image_format') },
                    size: { less_than: 5.megabytes, message: I18n.t('errors.should_be_less_than_5MB') }
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :author_user, length: { maximum: 30 }

  def self.search(term)
    if term
      approved.where('title ILIKE ?', "%#{term}%")
    else
      approved
    end
  end
end

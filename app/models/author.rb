class Author < ApplicationRecord
  has_one_attached :image
  has_many :tales, dependent: :destroy
  def self.search(term)
    if term
      where('name ILIKE ?', "%#{term}%")
    else
      all
    end
  end
end

class Category < ApplicationRecord
  has_many :tales
  validates :name, presence: true, length: { maximum:100 }
  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end
end

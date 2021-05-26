class Favourite < ApplicationRecord
  belongs_to :favouriter, class_name: "User"
  belongs_to :favourited, class_name: "Tale"
  validates :favouriter_id, presence: true
  validates :favourited_id, presence: true
end

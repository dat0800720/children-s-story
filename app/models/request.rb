class Request < ApplicationRecord
  belongs_to :user
  enum status: [:seen, :notseen]
end

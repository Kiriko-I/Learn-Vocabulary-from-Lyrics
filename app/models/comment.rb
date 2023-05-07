class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :message, presence: true, lengh: {maximum: 70}
end

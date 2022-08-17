class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true,  inclusion: { in: CATEGORIES, message: "%{value} is not a valid category" }

  has_many :reviews, dependent: :destroy

end

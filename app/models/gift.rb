class Gift < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :gift_categories
  has_many :categories, through: :gift_categories
end

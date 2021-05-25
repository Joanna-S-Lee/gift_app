class GiftCategory < ApplicationRecord
  belongs_to :gift
  belongs_to :category
end

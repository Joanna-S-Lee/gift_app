class Gift < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :gift_categories
  has_many :categories, through: :gift_categories

  include PgSearch::Model

  pg_search_scope :search_by_name,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
  

end


# class Gift < ApplicationRecord
#   belongs_to :user

#   include PgSearch::Model

#   pg_search_scope :search_by_name,
#     against: [ :name, :description ],
#     associated_against: {
#       author: [ :first_name, :last_name ]
#     },
    # using: {
    #   tsearch: { prefix: true }
    # }
# end
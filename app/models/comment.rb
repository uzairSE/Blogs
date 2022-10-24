class Comment < ApplicationRecord
  include Visible
  belongs_to :post
  has_many :pictures, as: :imageable
end

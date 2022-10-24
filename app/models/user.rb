class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, through: :posts ,dependent: :destroy
    #scope: desc_order, -> {order(id: :desc)}
    has_many :subordinates, class_name: "User", foreign_key: "manager_id"

    belongs_to :manager, class_name: "User" , optional: true
end

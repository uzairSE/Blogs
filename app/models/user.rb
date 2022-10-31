class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, through: :posts ,dependent: :destroy
    #scope: desc_order, -> {order(id: :desc)}
    has_many :friends, class_name: "User", foreign_key: "user_id"
    validates :name,presence: {message: "Must be given ok"}
    has_and_belongs_to_many :user, class_name: "User" , optional: true
end

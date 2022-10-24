class Category < ApplicationRecord

    #has_and_belongs_to_many :products
    has_many :Categorization
    has_many :categories, through => :Categorization
end

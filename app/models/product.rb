class Product < ApplicationRecord
    #has_and_belongs_to_many :categories

    has_many :Categorization
    has_many :categories, through => :Categorization
end

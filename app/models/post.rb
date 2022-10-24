class Post < ApplicationRecord
  include Visible
   # self.table_name = "my_post"
    has_many :comments , dependent: :destroy
    
    belongs_to :user
    has_many :pictures, as: :imageable
   before_validation :ensure_title_has_a_value 
   before_save :ensure_title_has_a_value 
    validates :title, presence: true
    validates :body, presence: true, length: {minimum:10}
    
    after_initialize do |post|
        puts "You have initialized an object!"
      end
    private
      def ensure_title_has_a_value
            if title.nil?
                self.title = body 
                
            end
        end
end

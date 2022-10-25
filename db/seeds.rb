# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# u = User.create([{name: "seed"},{name: "seeding"}])
10.times do |i|
    p = Post.create!({title:"Ghayoor #{i}",body:"seedingof10", status:"public",user_id: "3"})
   
end

p "Created #{Post.count} posts"
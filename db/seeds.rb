require_relative '../lib/populator_fix.rb'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#TweetPost.populate 10000 do |u|
#    u.post = Faker::Movies::StarWars.quote
#    u.id_owner = rand(1..3)
#    u.user_id =  rand(1..3)
#end    
a=1 
Like.populate 8000 do |u|
    u.user_id = 3
    u.tweet_post_id = a
    a = a+1
end




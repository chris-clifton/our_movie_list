# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "bones",
             email: "bones@boneyard.com",
             password:              "foobarbaz",
             password_confirmation: "foobarbaz",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n}@ourmovielist.com"
  password = "password"
  User.create!(name: name,
                email: email,
                password:               password,
                password_confirmation:  password,
                activated: true,
                activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
10.times do |n|
  name = Faker::Name.name
  users.each { |user| user.lists.create!(name: "#{user.name}'s list ##{n}") }
end

users = User.all
user  = users.first
friends = users[2..50]
friends.each { |friend_user| user.friend(friend_user) }

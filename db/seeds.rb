# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user_1 = User.find_by(email: "abc@abc.com")
unless user_1.present?
  user_1 = User.create(
    email: "abc@abc.com",
    password: "123123123",
    password_confirmation: "123123123")
end

user_2 = User.find_by(email: "abcd@gmail.com")
unless user_2.present?
  user_2 = User.create(
    email: "abcd@gmail.com",
    password: "123123123",
    password_confirmation: "123123123"
  )
end

item_1 = Item.create(
  name: "Pink Collar",
  price: "3.99",
  description: "Cute pink collar for cats",
  seller: user_2
)

item_2 = Item.create(
  name: "Organic catnip",
  price: "10.00",
  description: "Home grown organic catnip",
  seller: user_2
)

item_3 = Item.create(
  name: "Organic cat food",
  price: "39.99",
  seller: user_1
)

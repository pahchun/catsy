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

Category.create!([
  {name: "All"},
  {name: "Toys"},
  {name: "Food"},
  {name: "Litter"},
  {name: "Furniture"},
  {name: "Others"}
  ])

item_1 = Item.create(
  name: "Pink Collar",
  price: "3.99",
  description: "Cute pink collar for cats",
  item_picture_url: open("http://www.chrome-bones.com/media/catalog/product/cache/3/image/9df78eab33525d08d6e5fb8d27136e95/1/1/1100pk-1-new.png"),
  seller: user_2,
  category_id: 6
)

item_2 = Item.create(
  name: "Feather Teasing Toy",
  price: "27.97",
  description: "Made with real bird feathers. Cats go crazy to play with this toy!!",
  item_picture_url: open("http://cdn.instructables.com/FCC/G4ZY/GW8980JR/FCCG4ZYGW8980JR.MEDIUM.jpg"),
  seller: user_2,
  category_id: 2
)

item_3 = Item.create(
  name: "Organic cat food",
  price: "39.99",
  seller: user_1,
  category_id: 3
)

10.times do
  Item.create(
    name: "Organic catnip",
    price: "15.00",
    description: "All cats love this catnip. Tested with 25 cats from neighborhood. Home grown catnip plant, dried, and made.",
    item_picture_url: open("http://chilloutkitty.com/wp-content/uploads/2015/03/catnip7.jpg"),
    seller: user_1,
    category_id: 3
  )

end

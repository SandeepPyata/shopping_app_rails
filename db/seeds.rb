# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all

Product.create!([
  {
    id: 1,
    name: "pen",
    description: "it writes",
    price: 5.0,
    image_link: "https://www.shutterstock.com/image-photo/blue-pen-isolated-on-white-260nw-557418118.jpg"
  },
  {
    id: 2,
    name: "pencil",
    description: "it writes and can be erased",
    price: 4.0,
    image_link:
    "https://m.media-amazon.com/images/I/61T1q6XhylL._SX522_.jpg"
  },
  {
    id: 3,
    name: "eraser",
    description: "used to erase",
    price: 3.0,
    image_link: "https://tiimg.tistatic.com/fp/1/007/763/easy-to-uses-neat-and-clean-rectangular-white-eraser-914.jpg"
  },
  {
    id: 4,
    name: "sharpner",
    description: "used to sharpen pencil",
    price: 3.0,
    image_link: "https://media.istockphoto.com/id/1403799120/photo/one-pink-colour-sharpner-with-white-background.jpg?b=1&s=170667a&w=0&k=20&c=E3Jywl2VtaUju4ipoV3-CWjR5ntXEO-V-wcMQKqacoY="
  }
])

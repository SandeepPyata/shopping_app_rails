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
    name: "Noise Pulse Go Buzz Smart Watch",
    description: "Tru Sync, BT calling, utility features, Noise Health Suite, 150+ cloud-based & customised watch faces, 100 sports modes, IP68 water resistance, 5 colours.",
    price: 1699,
    image_link: "https://m.media-amazon.com/images/I/61akt30bJsL._SX522_.jpg"
  },
  {
    id: 2,
    name: "Redgear Gaming headphones",
    description: "Redgear Cloak provides enhanced audio bass, Omni-directional microphone, and RGB LED light effect.",
    price: 599,
    image_link:
    "https://m.media-amazon.com/images/I/41EJrZlo0UL._SX300_SY300_QL70_FMwebp_.jpg"
  },
  {
    id: 3,
    name: "OnePlus Buds Z2",
    description: "Active Noise Cancellation, High Quality Sound, 3-MIC ENC Call Noise Reduction, Long Battery Life, and IP55 Water/Sweat Resistance.",
    price: 4999,
    image_link: "https://m.media-amazon.com/images/I/51AMqyp+sfL._SX522_.jpg"
  },
  {
    id: 4,
    name: "Acer Nitro 5 11th Gen Laptop",
    description: "Killer DoubleShot Pro with Ethernet E2600 and Wi-Fi 6 AX1650 maximizes gaming performance.",
    price: 63300,
    image_link: "https://m.media-amazon.com/images/I/71evs2WKJjS._SX522_.jpg"
  }
])

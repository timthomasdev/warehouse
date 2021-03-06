# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ware = Ware.new(name: 'Extreme Programming Explained', description: "Second Edition of Extreme Programming Explained by Kent Beck with Cynthia Andres, Lightly used", price_cents: 1500, status: :available) 
ware.image.attach(io: File.open('app/assets/images/test.png'), filename: 'test.png', content_type: 'image/png')
ware.save!

ware = Ware.new(name: 'Apple Watch Series 3', description: "Black aluminum 37mm with basic wristband. Purchased in 2018", price_cents: 7500, status: :available)
ware.image.attach(io: File.open('app/assets/images/test.png'), filename: 'test.png', content_type: 'image/png')
ware.save!

ware = Ware.new(name: 'Nothing', description: "You will receive nothing after purchasing this item, I think $10 is a fair price for nothing", price_cents: 1000, status: :available)
ware.image.attach(io: File.open('app/assets/images/test.png'), filename: 'test.png', content_type: 'image/png')
ware.save!



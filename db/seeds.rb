# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

arrangements = Arrangement.create([{ title: 'Summer day', description: 'bring light to your home with this joyful arrangement, with yellow roses, orange lilies and some greens.', price: 35}, {title: 'Think Pink', description: 'love pink? us too! enjoy this bubbly bouquet with pink buttercups, pink roses and pink daisies. fun!', price: 30}])

users = User.create(name: 'Sarah', email: 'sarah@hotmail.com', password: "sarah", address: '214 Washington street, apt.2, Hoboken NJ.')

Order.create(user_id: 1, arrangement_id: 1, delivery_day: "Monday")

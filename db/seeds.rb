# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


arrangements = Arrangement.create([
    { 
      title: 'Summer day', 
      description: 'bring light to your home with this joyful arrangement, containig sunflowers, yellow roses and white hydrengea.', 
      price: 40, 
      height: 'Tall',
      image: 'summer_day.jpg'
        }, 
    {
        title: 'Think Pink', 
        description: 'love pink? us too! enjoy this bubbly bouquet with pink buttercups, pink roses and pink tulips. fun!',
        price: 30, 
        height: 'Short',
        image: 'thinkpink.jpg'
        },
    {   
        title: 'Farmers market', 
        description: 'Bring farmers market to your home with this lovely and colorful daisy assortment basket.',
        price: 37, 
        height: 'Medium (average)',
        image: 'daisy_basket.jpg'
        },
    {
        title: 'Love is in the air', 
        description: 'Feel romantic? We have the perfect bouquet for you! A delicate arrangement of unique white roses with red edges',
        price: 35, 
        height: 'Medium (average)',
        image: 'love2.jpg'
        },
        
    {
        title: 'Pure elegance', 
        description: 'Impress your friends with this elegant and delicate arrangement, containing white lilies, white roses and white tulips.  ',
        price: 30, 
        height: 'Short',
        image: 'pure_elegance.jpg'
        }
    ])

users =  User.create([
    {
       name: 'Sarah', 
       email: 'sarah@hotmail.com', 
       password: "sarah", address: '214 Washington street, apt.2, Hoboken NJ.'
       },

    {
       name: 'Bob', 
       email: 'bob@hotmail.com', 
       password: "bob", 
       address: '456 River road, San Diego, CA.'
       },
    {
       name: 'Mika', 
       email: 'mika@gmail.com', 
       password: "mikmik",
       address: "87 Park Av. Maui, Hawaii",
       admin: true
       }, 
       
])
orders = Order.create([
    {
        user_id: 1, 
        arrangement_id: 1, 
        delivery_day: "{1 => 2019, 2 => 4, 3 => 4}"
        },
    {
        user_id: 2, 
        arrangement_id: 3, 
        delivery_day: "{1 => 2019, 2 => 3, 3 => 4}"
        },
    {
        user_id: 1, 
        arrangement_id: 3, 
        delivery_day: "{1 => 2019, 2 => 4, 3 => 4}"
        }
])
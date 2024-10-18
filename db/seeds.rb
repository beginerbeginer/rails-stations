# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)
movies = Movie.create([
  { name: 'Star Wars', year: '1977', description: 'Sci-fi epic', image_url: 'https://picsum.photos/200/300', is_showing: true },
  { name: 'Lord of the Rings', year: '2001', description: 'Fantasy adventure', image_url: 'https://picsum.photos/200/300', is_showing: false }
])

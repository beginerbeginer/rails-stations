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

# Insert sheets data
Sheet.create([
  { id: 1, column: 1, row: 'a' },
  { id: 2, column: 2, row: 'a' },
  { id: 3, column: 3, row: 'a' },
  { id: 4, column: 4, row: 'a' },
  { id: 5, column: 5, row: 'a' },
  { id: 6, column: 1, row: 'b' },
  { id: 7, column: 2, row: 'b' },
  { id: 8, column: 3, row: 'b' },
  { id: 9, column: 4, row: 'b' },
  { id: 10, column: 5, row: 'b' },
  { id: 11, column: 1, row: 'c' },
  { id: 12, column: 2, row: 'c' },
  { id: 13, column: 3, row: 'c' },
  { id: 14, column: 4, row: 'c' },
  { id: 15, column: 5, row: 'c' }
])

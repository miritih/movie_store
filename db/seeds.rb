# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

genre = [:Action, :Adventure, :Animation, :Biography, :Comedy, :Crime,
:Documentary, :Drama,
:Fantasy, :History, :Horror, :Musical, :Mystery, :Romance, :SciFi, :Thriller, :War, :Western]

Genre.delete_all
genre.each{|g| Genre.create!(name: g.to_s)}
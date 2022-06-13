# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Author.destroy_all
Book.destroy_all

john = Author.create(name:'John', age:37)
matt = Author.create(name:'Matt', age:22)


Book.create(name:'the story of john', genre:'fiction', author_id:john.id)


john.books.create(name:'the life of john', genre:'fiction')
matt.books.create(name:'the life of matt', genre:'fiction')

puts Author.all.size

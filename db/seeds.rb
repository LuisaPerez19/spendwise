# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."

Category.destroy_all
User.delete_all

user1 = User.create!(
  email: "sam@myevent.com",
  password: "123456",
  password_confirmation: "123456"
)

home = Category.create!(name: 'Home', user_id:user1)

food = Category.create!(name: 'Food', user_id:user1)

transport = Category.create!(name: 'Transport', user_id:user1)

going_out = Category.create!(name: 'Going out', user_id:user1)

puts "finished..."

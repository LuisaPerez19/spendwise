# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."

Expense.destroy_all
Category.destroy_all
User.delete_all

user1 = User.create!(
  email: "kris@myevent.com",
  password: "123456",
  password_confirmation: "123456"
)

# puts "User created with ID: #{user1.id}"

# home = Category.create!(name: 'Home', amount: 0, user_id:user1)

# food = Category.create!(name: 'Food',amount: 0, user_id:user1)

# transport = Category.create!(name: 'Transport',amount: 0,  user_id:user1)

# going_out = Category.create!(name: 'Going out', amount: 0,  user_id:user1)

# home = Category.create!(name: 'Home', amount: 0, user_id:user1)

# begin
morissons = Expense.create!(
  title: 'Morrisons',
  amount: 10,
  date:Date.new(2024, 4, 13),
  category_id:food.id,
  user_id:user1.id)
# rescue ActiveRecord::RecordInvalid => invalid
#   puts invalid.record.errors
# end

puts "finished..."

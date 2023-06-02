# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@customer = Customer.create!(first_name: "Dawson", last_name: "Timmons", email: "Dawsontimmons@gmail.com", address: "36367 test st.")
Customer.create!(first_name: "Scott", last_name: "Timmons", email: "Scotttimmons@gmail.com", address: "36368 test st.")
Customer.create!(first_name: "Cindy", last_name: "Timmons", email: "Cindytimmons@gmail.com", address: "36369 test st.")
Customer.create!(first_name: "Dylan", last_name: "Timmons", email: "Dylantimmons@gmail.com", address: "36360 test st.")

@customer.subscriptions.create!( title: "Earl Grey Mix", price: 15.99, status: "Active", frequencey: "Monthly" )
@customer.subscriptions.create!( title: "Green Mix", price: 7.99, status: "Inactive", frequencey: "Monthly" )
@customer.subscriptions.create!( title: "Sleepy Mix", price: 12.99, status: "Active", frequencey: "Monthly" )
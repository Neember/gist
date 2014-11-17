puts "Start seeding Admin"
Admin.delete_all
Admin.create! email: 'john@example.com', password: '123123123', password_confirmation: '123123123'
puts "Finish seeding Admin"

puts 'Start seeding User'
User.delete_all
User.create! email: 'john@futureworkz.com', password: '123123123', password_confirmation: '123123123'
puts "Finish seeding User"
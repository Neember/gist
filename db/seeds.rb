puts "Start seeding Admin"
Admin.delete_all
Admin.create! email: 'stevenyap@futureworkz.com', password: '123123123', password_confirmation: '123123123'
Admin.create! email: 'jack@futureworkz.com', password: '123123123', password_confirmation: '123123123'
Admin.create! email: 'john@futureworkz.com', password: '123123123', password_confirmation: '123123123'
puts "Finish seeding Admin"

puts 'Start seeding User'

User.delete_all

usernames = ['john', 'martin', 'jack', 'stevenyap', 'frank', 'khoa', 'maicon', 'seika', 'anthony']

usernames.each do |username|
  User.find_or_create! email: "#{username}@futureworkz.com", username: username, password: '123123123', password_confirmation: '123123123'
end
puts "Finish seeding User"

puts 'Start seeding tags'
Tag.create! title: 'CSS'
Tag.create! title: 'Ruby'
Tag.create! title: 'Ruby on Rails'
Tag.create! title: 'Javascript'
Tag.create! title: 'Refactor'
Tag.create! title: 'SCSS'
Tag.create! title: 'SOLID'
Tag.create! title: 'CoffeeScript'
Tag.create! title: 'Git'
puts "Finish seeding User"

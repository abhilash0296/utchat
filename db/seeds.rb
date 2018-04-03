# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_password = 'user123'
1.upto(5) do |i|
  user = User.create(
    email: "user-#{i}@usermail.com",
    password: user_password,
    password_confirmation: user_password
  )
  user.add_role "user"
end

trainer_password = 'trainer123'
1.upto(5) do |i|
  trainer = User.create(
    email: "trainer-#{i}@trainermail.com",
    password: trainer_password,
    password_confirmation: trainer_password
  )
  trainer.add_role "trainer"
end
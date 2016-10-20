# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by!({email: ENV.fetch('DEVISE_ADMIN_EMAIL', 'admin@example.com')}) do |user|
  user.password = 'password'
end

TestModel.find_or_create_by!({title: 'test title', body: 'test body'})

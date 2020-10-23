# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


normal_user = User.create!(email: 'normal_user@gmail.com', password: 'password', password_confirmation: 'password')
editor_user = User.create!(email: 'editor_user@gmail.com', password: 'password', password_confirmation: 'password', roles: :editor)
admin_user = User.create!(email: 'editor_user@gmail.com', password: 'password', password_confirmation: 'password', roles: :admin)
Article.create!(title: 'Hello World', category: 'Art', content: 'Lorem Ipsum', user: editor_user)
Article.create!(title: 'Hello World', category: 'Business', content: 'Lorem Ipsum', user: editor_user)
Article.create!(title: 'Hello World', category: 'Finance', content: 'Lorem Ipsum', user: editor_user)
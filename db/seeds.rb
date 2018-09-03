# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Admin_User',
            status: 0,
            email: 'a@example.com',
            password: '111111',
            password_confirmation: '111111')

User.create(name: 'Sub_Admin_User',
            status: 1,
            email: 'sa@example.com',
            password: '111111',
            password_confirmation: '111111')

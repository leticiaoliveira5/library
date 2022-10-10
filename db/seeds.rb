# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cria usuário admin
User.create!(email: 'admin@library.net', password: '654321', role: 0, name: 'Admin')

# Cria usuário comum
User.create!(email: 'maria@gmail.web', password: '654321', role: 1, name: 'Maria')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cria usuário admin
User.create!(email: 'admin@app.net', password: '123456', role: 0, name: 'Admin')

# Cria usuário comum
User.create!(email: 'maria@gmail.web', password: '654321', role: 1, name: 'Maria')

# Cria categorias
Category.create(name: 'Mistério')
Category.create(name: 'Não Ficção')
Category.create(name: 'Didático')
Category.create(name: 'Poesia')

# Cria autores
Author.create(name: 'Clarice Lispector')
Author.create(name: 'Stephen King')
Author.create(name: 'Charles Dickinson')
Author.create(name: 'Machado de Assis')
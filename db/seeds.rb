# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new(email: "alyssa@gmail.com", password: "123456")
user1.first_name = "Alyssa"
user1.last_name = "Biot"
user1.address = "16 villa Gaudelet 75011 Paris"
user1.average_rating = 3.5
user1.save

user2 = User.new(email: "isabelle@gmail.com", password: "123456")
user2.first_name = "Isabelle"
user2.last_name = "Bonnard"
user2.address = "12 villa Gaudelet 75011 Paris"
user2.average_rating = 4.5
user2.save

user3 = User.new(email: "clemence@gmail.com", password: "123456")
user3.first_name = "Clemence"
user3.last_name = "Thivet"
user3.address = "110 rue Oberkampf 75011 Paris"
user3.average_rating = 5.0
user3.save

user4 = User.new(email: "domitile@gmail.com", password: "123456")
user4.first_name = "Domitile"
user4.last_name = "Chenut"
user4.address = "92 rue Oberkampf 75011 Paris"
user4.average_rating = 3.0
user4.save

user5 = User.new(email: "Marc@gmail.com", password: "123456")
user5.first_name = "Marc"
user5.last_name = "Test"
user5.address = "102 rue Oberkampf 75011 Paris"
user5.average_rating = 1.0
user5.save

skill1 = Skill.new(category: "Pets", location:"Paris", price_per_hour: 10.5, title: "Dog sitting in Paris", description: "Je promène des chiens depuis 12 ans dans le monde entier. Calme et affectueuse, je prendrai le plus grand soin de vos amours !")
skill1.user = user1
skill1.save

skill2 = Skill.new(category: "Kids", location:"Paris", price_per_hour: 12, title: "Kids homework", description: "Titulaire d'un CAP petite enfance, j'aide vos enfants à faire leurs devoirs, toutes matières primaire et collège. Pasciente et énergique, je prendrai le plus grand soin de vos amours !")
skill2.user = user1
skill2.save

skill3 = Skill.new(category: "Kids", location:"Paris", price_per_hour: 12, title: "Help your kids out with their homeworks", description: "Professeur particulier à domicile de mathématiques pour collègiens et lycéens en difficulté ! Avec moi, les résultats sont visibles dès le premier cours !")
skill3.user = user2
skill3.save

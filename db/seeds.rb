# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# users
User.create(name: 'Maria Altebarmakian', email:'maltebar@brandeis.edu', password: '12345678', admin: 'true')
User.create(name: 'Anna Yatskar', email:'anyatskar@brandeis.edu', password: '12345678', admin: 'true')
User.create(name: 'Ken Harsch', email: 'kharsch@brandeis.edu', password: '12345678', admin: 'true')
User.create(name: 'Antonella DiLillo', email: 'dilant@brandeis.edu', password: '12345678', admin: 'true')
User.create(name: 'No Partner', email: 'ghost@brandeis.edu', password: '12345678', admin: 'false')

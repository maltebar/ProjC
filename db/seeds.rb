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
User.create(name: 'Billy Bob', email: 'billybob@brandeis.edu', password: '12345678', admin: 'false') #id3
User.create(name: 'Jane Jean', email: 'janejean@brandeis.edu', password: '12345678', admin: 'false') #id4
User.create(name: 'Sally Sue', email: 'sallysue@brandeis.edu', password: '12345678', admin: 'false') #id5
User.create(name: 'Lola Lou', email: 'lolalou@brandeis.edu', password: '12345678', admin: 'false') #id6
User.create(name: 'Betty Bee', email: 'bettybee@brandeis.edu', password: '12345678', admin: 'false') #id7
User.create(name: 'John Jo', email: 'johnjo@brandeis.edu', password: '12345678', admin: 'false') #id8

Assignment.create(title: 'Assignment 1', description: 'Find the max value of a 2D array', complete: true, active: false, solution: 'This is the answer for the max 2D array.')
Assignment.create(title: 'Assignment 2', description: 'Calculate the sum of the first five Fibonacci numbers.', complete: false, active: true, solution: 'This is the answer for the Fibonacci problem.')
Assignment.create(title: 'Assignment 3', description: 'What is the big-oh of the given algorithm?', complete: false, active: false, solution: 'O(nlogn).')
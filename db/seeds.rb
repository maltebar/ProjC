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
User.create(name: 'No Partner', email: 'ghost@brandeis.edu', password: '12345678', admin: 'false')


Assignment.create(title: 'Assignment 1', description: 'Find the max value of a 2D array', pretest: 'Tell me about arrays.', posttest: 'What did you learn about arrays?', complete: true, active: false, solution: 'This is the answer for the max 2D array.')
Assignment.create(title: 'Assignment 2', description: 'Calculate the sum of the first five Fibonacci numbers.', pretest: 'Tell me about Fibonacci.', posttest: 'What did you learn about Fibonacci?', complete: false, active: true, solution: 'This is the answer for the Fibonacci problem.')
Assignment.create(title: 'Assignment 3', description: 'What is the big-oh of the given algorithm?', pretest: 'Tell me about big-oh.', posttest: 'What did you learn about complexity?', complete: false, active: false, solution: 'O(nlogn).')


Assignment.create(title: 'Test Assignment', description: 'Write a method that finds the max value of an array.', pretest: 'What is your favorite animal?', posttest: 'What is your favorite color?')
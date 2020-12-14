# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Test.all.empty?
  users = User.create!([
                 { name: 'Igor', email: 'igor@igor.com' },
                 { name: 'Sergey', email: 'sergey@sergey.com' },
                 { name: 'Sveta', email: 'sveta@sveta.com' },
                 { name: 'Luke', email: 'luke@luke.com' }
               ])

  categories = Category.create([
                                 { title: 'Backend' },
                                 { title: 'Frontend' },
                                 { title: 'Mobile Develop' },
                                 { title: 'Machine Lear' }
                               ])

  tests = Test.create!([
                { title: 'Ruby', level: 1, category: categories[0], author: users[0] },
                { title: 'JavaScript', level: 3, category: categories[1], author: users[1] },
                { title: 'Android', level: 4, category: categories[2], author: users[2] },
                { title: 'Assembler', level: 5, category: categories[3], author: users[3] }
              ])
  
  questions = Question.create!([
                     { body: 'easy question for Ruby', test: tests[0] },
                     { body: 'hard question for Android', test: tests[1] },
                     { body: 'medium question for JavaScript', test: tests[2] },
                     { body: 'ultra-hard question for Assembler', test: tests[3] }
                   ])

  Answer.create!([
                   { title: '1) what is the answer', question: questions[0] },
                   { title: '2) what is the answer', question: questions[1] },
                   { title: '3) what is the answer', question: questions[2] },
                   { title: '4) what is the answer', question: questions[3] }
                 ])
end

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Test.all.empty?
  User.create!([
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

  Test.create!([
                { title: 'Ruby', level: 1, category_id: categories[0].id },
                { title: 'JavaScript', level: 3, category_id: categories[1].id },
                { title: 'Android', level: 4, category_id: categories[2].id },
                { title: 'Assembler', level: 5, category_id: categories[3].id }
              ])
  
  Question.create!([
                     { body: 'easy question for Ruby', test_id: 1 },
                     { body: 'hard question for Android', test_id: 2 },
                     { body: 'medium question for JavaScript', test_id: 3 },
                     { body: 'ultra-hard question for Assembler', test_id: 4 }
                   ])

  Answer.create!([
                   { title: '1) what is the answer', question_id: 1 },
                   { title: '2) what is the answer', question_id: 2 },
                   { title: '3) what is the answer', question_id: 3 },
                   { title: '4) what is the answer', question_id: 4 }
                 ])
end

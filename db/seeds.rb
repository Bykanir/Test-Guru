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
                         { name: 'Sergey', email: 'sergey@example.com', password: '123456', 
                           first_name: 'Sergey', last_name: 'Admin', type: 'Admin' },
                         { first_name: 'Luke', email: 'luke@example.com', password: '123456' }
                       ])

  categories = Category.create([
                                 { title: 'Backend' },
                                 { title: 'Frontend' },
                                 { title: 'Mobile Develop' },
                                 { title: 'Machine Lear' }
                               ])

  tests = Test.create!([
                         { title: 'Ruby', level: 1, category: categories[0], author: users[0] },
                         { title: 'JavaScript', level: 3, category: categories[1], author: users[0] },
                       ])

  questions = Question.create!([
                                 { body: 'easy question for Ruby', test: tests[0] },
                                 { body: 'hard question for Ruby', test: tests[0] },
                                 { body: 'medium question for JavaScript', test: tests[1] },
                                 { body: 'ultra-hard question for JavaScript', test: tests[1] }
                               ])

  Answer.create!([
                   { title: '1) Answer', question: questions[0] },
                   { title: '2) Correct answer', correct: true, question: questions[0] },
                   { title: '3) Answer', question: questions[0] },
                   { title: '4) Answer', question: questions[0] },
                   { title: '1) Answer', question: questions[1] },
                   { title: '2) Answer', question: questions[1] },
                   { title: '3) Correct Answer', correct: true, question: questions[1] },
                   { title: '4) Answer', question: questions[1] },
                   { title: '1) Answer', question: questions[2] },
                   { title: '2) Correct answer', correct: true, question: questions[2] },
                   { title: '3) Answer', question: questions[2] },
                   { title: '4) Answer', question: questions[2] },
                   { title: '1) Answer', question: questions[3] },
                   { title: '2) answer', question: questions[3] },
                   { title: '3) Correct Answer', correct: true, question: questions[3] },
                   { title: '4) Answer', question: questions[3] }
                 ])
end

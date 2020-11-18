# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Liza')
User.create(name: 'Sergey')
User.create(name: 'Sophi')
User.create(name: 'Misa')

Category.create(title: 'Backend')
Category.create(title: 'Frontend')
Category.create(title: 'Mobile Develop')
Category.create(title: 'Machine Lear')

Test.create(title: 'Ruby', level: '1', category_id: '1')
Test.create(title: 'JavaScript', level: '3', category_id: '2')
Test.create(title: 'Android', level: '0', category_id: '3')
Test.create(title: 'Assembler', level: '5', category_id: '4')

Question.create(body: 'easy question for Ruby', test_id:'1')
Question.create(body: 'hard question for Android', test_id: '2')
Question.create(body: 'medium question for JavaScript', test_id: '3')
Question.create(body: 'ultra-hard question for Assembler', test_id: '4')

Answer.create(title: '1) what is the answer', question_id: '1')
Answer.create(title: '2) what is the answer', question_id: '2')
Answer.create(title: '3) what is the answer', question_id: '3')
Answer.create(title: '4) what is the answer', question_id: '4')
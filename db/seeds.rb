# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Question.find_by(id: 1) || Question.create(
  id: 1, 
  question: 'Who won the NBA Most Valuable Player Award in 2014?',
  answer: 'Kevin Durant'
)

Question.find_by(id: 2) || Question.create(
  id: 2, 
  question: 'Who won the NBA Most Valuable Player Award in 2013?',
  answer: 'LeBron James'
)

Question.find_by(id: 3) || Question.create(
  id: 3, 
  question: 'Who won the NBA Most Valuable Player Award in 2012?',
  answer: 'LeBron James'
)

Question.find_by(id: 4) || Question.create(
  id: 4, 
  question: 'Who won the NBA Most Valuable Player Award in 2011?',
  answer: 'Derrick Rose'
)


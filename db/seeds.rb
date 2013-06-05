# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = Cat.create!(:name =>  "Sisi", :age => 2, :color => "brown", :sex => "f")
cat2 = Cat.create!(:name =>  "Sushi", :age => 2, :color => "white", :sex => "f")
cat3 = Cat.create!(:name =>  "Ben", :age => 3, :color => "brown", :sex => "f")
cat4 = Cat.create!(:name =>  "Hoho", :age => 5, :color => "orange", :sex => "f")



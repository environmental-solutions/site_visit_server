# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

project = Project.where({name: 'Trump Foundation'}).first_or_create

site1 = Site.where({name: 'Trump Towner', description: 'Manhattan Tower'}).first_or_create
site2 = Site.where({name: 'Panama Hotel', description: 'Money Laundering Hotel'}).first_or_create

project.sites << site1
project.sites << site2

project = Project.where({name: 'Mar-a-Lago'}).first_or_create

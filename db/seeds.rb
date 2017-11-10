# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

project = Project.where({name: 'Project 1'}).first_or_create

site1 = Site.where({name: 'Site 1', description: 'Site 1 description'}).first_or_create
site2 = Site.where({name: 'Site 2', description: 'Site 2 description'}).first_or_create

project.sites << site1
project.sites << site2



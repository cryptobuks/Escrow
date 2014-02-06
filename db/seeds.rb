# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

	user = User.create({firstname:"randy", lastname:"wdi", email:"jtbitt@gmail.com", username:"randy1",
		phonenumber:"3123131212"})

	contact = Contact.create({name:"jay", phonenumber:"4321213232"})

	message = Message.create({name:"jonny", phonenumber:"3103029392", message:"what up homie", timewhen: "3/25/14" })

# msg1 = user.messages.create( .... )
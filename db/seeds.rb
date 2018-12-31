# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


#TODO: Create a bunch more users with Faker

#Users
april = User.create!(email: "april@gmail.com", password: "123asdf123")
lloyd = User.create!(email: "lloyd@yahoo.com", password: "woofwoof12")
adam = User.create!(email: "adam@snowflek.com", password: "snowfleklvr")

#Friendships
april.friends << lloyd
adam.friends << lloyd

#Droplets
april.droplets.create!(content: "I'm having a good day [friends]",
                       permission: "friends")
april.droplets.create!(content: "I like Sightglass decaf [friends]",
                       permission: "friends",
	                   created_at: Time.now - 1.year)
april.droplets.create!(content: "My deepest secret [personal]",
	                   permission: "personal",
	                   created_at: Time.now - 1.day)
april.droplets.create!(content: "My darkest secret [personal]",
                       permission: "personal",
                       created_at: Time.now - 2.years)

lloyd.droplets.create!(content: "Woof woof woof [friends]",
                       permission: "friends")
lloyd.droplets.create!(content: "Bark bark bark [friends]",
                       permission: "friends",
                       created_at: Time.now - 1.year)
lloyd.droplets.create!(content: "I can secretly talk [personal]",
                       permission: "personal",
                       created_at: Time.now - 1.day)
lloyd.droplets.create!(content: "I know calculus [personal]",
                       permission: "personal",
                       created_at: Time.now - 2.years)

adam.droplets.create!(content: "I live in San Francisco [friends]",
                      permission: "friends")
adam.droplets.create!(content: "I like music [friends]",
                      permission: "friends",
                      created_at: Time.now - 1.year)
adam.droplets.create!(content: "I want to steal lloyd [personal]",
                      permission: "personal",
                      created_at: Time.now - 1.day)
adam.droplets.create!(content: "My plot to steal lloyd is coming along [personal]",
                      permission: "personal",
                      created_at: Time.now - 2.years)

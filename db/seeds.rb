require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


#TODO: Create a bunch more users with Faker
#Users
april = User.create!(email: "april@gmail.com", password: "123asdf123")
lloyd = User.create!(email: "lloyd@yahoo.com", password: "woofwoof12")
adam = User.create!(email: "adam@snowflek.com", password: "snowfleklvr")

10.times do
	User.create!(
		email: Faker::Internet.free_email,
		password: Faker::Internet.password)
end


# FriendRequests. Note that friend_requests are deleted when a Friendship
# is created.
FriendRequest.create!(user: april, friend: lloyd)
FriendRequest.create!(user: adam, friend: april)
FriendRequest.create!(user: adam, friend: lloyd)
FriendRequest.create!(user: april, friend: User.find(10))
FriendRequest.create!(user: User.find(9), friend: april)
FriendRequest.create!(user: adam, friend: User.find(8))
FriendRequest.create!(user: User.find(7), friend: adam)

# Friendships
Friendship.create!(user: lloyd, friend: april)
Friendship.create!(user: april, friend: adam)
Friendship.create!(user: lloyd, friend: adam)

# Droplets
april.droplets.create!(content: "I'm having a good day")

User.last.droplets.create!(content: "I like Sightglass decaf")
                   .update_attributes(user: april,
                                     created_at: Time.now - 1.year)

User.last.droplets.create!(content: "My deepest secret")
                   .update_attributes(user: april,
                                     created_at: Time.now - 1.day)

User.last.droplets.create!(content: "My darkest secret")
                   .update_attributes(user: april,
                                     created_at: Time.now - 2.years)

lloyd.droplets.create!(content: "Woof woof woof")

User.last.droplets.create!(content: "Bark bark bark [friends]")
                  .update_attributes(user: lloyd,
                                     created_at: Time.now - 1.year)

User.last.droplets.create!(content: "I can secretly talk [personal]")
                  .update_attributes(user: lloyd,
                                     created_at: Time.now - 1.day)

User.last.droplets.create!(content: "I know calculus")
                  .update_attributes(user: lloyd,
                                     created_at: Time.now - 2.years)

adam
  .droplets
  .create!(content: "I live in San Francisco")
  .update_attributes(user: adam, created_at: Time.now - 1.day)

User.last.droplets.create!(content: "I like music")
                  .update_attributes(user: adam,
                                     created_at: Time.now - 1.year)

User.last.droplets.create!(content: "I want to steal lloyd")
                  .update_attributes(user: adam,
                                     created_at: Time.now - 1.day)

User.last.droplets.create!(content: "My plot to steal lloyd is coming along")
                  .update_attributes(user: adam,
                                     created_at: Time.now - 2.years)

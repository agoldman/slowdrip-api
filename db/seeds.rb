require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).




#------------------------------------------------------------#
# USERS WITH YEARLY DROPLETS Have droplets from this day on past years. 
# (droplets created at bottom of this file)
april = User.create!(email: "april@gmail.com", password: "123asdf123")
lloyd = User.create!(email: "lloyd@yahoo.com", password: "woofwoof12")
adam = User.create!(email: "adam@snowflek.com", password: "snowfleklvr")
#------------------------------------------------------------#




#------------------------------------------------------------#
# USERS WITH MONTHY DROPLETS, NOT YEARLY. These users have no posts from this day on past years.
# They do have posts from this day of past months.

#Wrote 90 droplets. Wrote everyday for 3 months.
frequent_writer_for_months = User.create!(email: "frequent_writer_for_months@gmail.com",
                                          password: "seeddatafortherestofmylife")
(1..90).each do |n|
  User.last.droplets.create!(content: "Day #{91-n}")
                    .update_attributes(user: frequent_writer_for_months,
                                       created_at: Time.now - (n).days)
end

#Wrote 90 droplets. Wrote every 3 days for 9 months.
occasional_writer_for_months = User.create!(email: "occasional_writer_for_months@gmail.com",
                                                        password: "thesunwillcomeouttomorrow")
(1..90).each do |n|
  User.last.droplets.create!(content: "Day #{91-n}")
                    .update_attributes(user: occasional_writer_for_months,
                                       created_at: Time.now - (n*3).days)
end
#------------------------------------------------------------#




#------------------------------------------------------------#
# USERS WITH WEEKLY DROPLETS, NOT YEARLY OR MONTHLY. These users have no posts from this day on
# past years or months. They do have posts form this day of the week in past weeks.

#Wrote 20 droplets. Wrote every day for weeks.
frequeny_writer_for_weeks = User.create!(email: "frequeny_writer_for_weeks@gmail.com",
                                         password: "seeddataforever")
(1..20).each do |n|
  User.last.droplets.create!(content: "Day #{21-n}")
                    .update_attributes(user: frequeny_writer_for_weeks,
                                       created_at: Time.now - (n).days)
end

#Wrote 6 droplets. Wrote occassionally (every 3 days) for weeks.
new_occasional_writer = User.create!(email: "new_occasional_writer@gmail.com",
                                           password: "dumbdoodeedumb1")
(1..7).each do |n|
  User.last.droplets.create!(content: "Day #{8-n}")
                    .update_attributes(user: new_occasional_writer,
                                       created_at: Time.now - (n*3).days)
end
#------------------------------------------------------------#




#------------------------------------------------------------#
#USER WITH ALL-TIME DROPLETS, BUT WITHOUT PAST DROPLETS ON THIS DAY OF THE YEAR.
#MONTH, OR WEEK.

# Wrote 6 droplets. Wrote every day
new_user_writes_daily = User.create!(email: "new_user_writes_daily@gmail.com",
                                         password: "abunchojunk123")
(1..6).each do |n|
  User.last.droplets.create!(content: "Day #{7-n}")
                    .update_attributes(user: new_user_writes_daily,
                                       created_at: Time.now - (n).days)
end
#------------------------------------------------------------#





#------------------------------------------------------------#
#More random users
10.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: Faker::Internet.password)
end
#------------------------------------------------------------#





#------------------------------------------------------------#
# FriendRequests. Note that friend_requests are deleted when a Friendship
# is created.
FriendRequest.create!(user: april, friend: lloyd)
FriendRequest.create!(user: adam, friend: april)
FriendRequest.create!(user: adam, friend: lloyd)
FriendRequest.create!(user: april, friend: User.find(10))
FriendRequest.create!(user: User.find(9), friend: april)
FriendRequest.create!(user: adam, friend: User.find(8))
FriendRequest.create!(user: User.find(7), friend: adam)
#------------------------------------------------------------#




#------------------------------------------------------------#
# Friendships
Friendship.create!(user: lloyd, friend: april)
Friendship.create!(user: april, friend: adam)
Friendship.create!(user: lloyd, friend: adam)
#------------------------------------------------------------#




#------------------------------------------------------------#
# YEARLY DROPLETS FOR LONGTIME USERS
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

User.last.droplets.create!(content: "My plot to steal lloyd is coming along")
                  .update_attributes(user: adam,
                                     created_at: Time.now - 2.years)
#------------------------------------------------------------#

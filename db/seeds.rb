# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_girl_rails'


# Genereting Some fake data in seed file by using factory girl, data will
# be invalid once we put it as production since factorygirl is loaded in
# testing environemnt but not production, will try to find a way to get around

# clear out data, better run rake db:setup
Lease.delete_all
User.delete_all
Space.delete_all
Room.delete_all
Message.delete_all


# create 3 users
# sign in(email: user1@example.com, password 123456) funther details look
# test/factories/user.rb
user1 = FactoryGirl.create :user, first_name: 'Ian', last_name: 'Bruce'
#email: user2@example.com, password 123456
user2 = FactoryGirl.create :user, first_name: 'Wes', last_name: 'Daily'
#email: user3@example.com, password 123456
user3 = FactoryGirl.create :user, first_name: 'Bryce', last_name: 'Wendalaar'


# create 4 status, only generate once never destory and never rerun
unless Status.exists?
  # create 4 status codes
  pending = FactoryGirl.create :status, name: 'pending'
  accept = FactoryGirl.create :status, name: 'accept'
  reject = FactoryGirl.create :status, name: 'reject'
end

=begin
create addresses : Those are not real stresses, probably cant use in
                Google Map, just test sample data
=end


# create spaces with 1 default picture
# user1 have 3 spaces
user1_space1 = FactoryGirl.create :space,
                                   user_id:user1.id,
                                   name:"Shopify",
                                   number: "30",
                                   postal_code: 'M5V 2J4'

user1_space1_picture_1 = FactoryGirl.create :image,
                                  location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic1.jpg')),
                                  space_id:user1_space1.id

user1_space1_picture_2 = FactoryGirl.create :image,
                                  location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic10.jpg')),
                                  space_id:user1_space1.id

user1_space2 = FactoryGirl.create :space,
                                  user_id:user1.id,
                                  name:"Google",
                                  number: "30",
                                  postal_code: 'M5H 2G4'

user1_space2_picture_1 = FactoryGirl.create :image,
                                  location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic2.jpg')),
                                  space_id:user1_space2.id

user1_space2_picture_2 = FactoryGirl.create :image,
                                  location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic11.jpeg')),
                                  space_id:user1_space2.id

user1_space3 = FactoryGirl.create :space,
                                  user_id:user1.id,
                                  name:"Amazon",
                                  number: "30",
                                  postal_code: 'L6Y 0C9'

user1_space3_picture_1 = FactoryGirl.create :image,
                                  location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic3.jpg')),
                                  space_id:user1_space3.id


# user2 have 3 space
user2_space1 = FactoryGirl.create :space,
                                   user_id:user2.id,
                                   name:"500Pixel",
                                   number: "21",
                                   postal_code: 'M5H 3G8'

user2_space1_picture_1 = FactoryGirl.create :image,
                                   location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic4.jpg')),
                                   space_id:user2_space1.id

user2_space2 = FactoryGirl.create :space,
                                  user_id:user2.id,
                                  name:"Apple",
                                  number: "21",
                                  postal_code: 'M5J 0A8'

user2_space2_picture_1 = FactoryGirl.create :image,
                                   location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic5.png')),
                                   space_id:user2_space2.id


user2_space3 = FactoryGirl.create :space,
                                  user_id:user2.id,
                                  name:"Microsoft",
                                  number: "21",
                                  postal_code: 'V5Z 2M9'

user2_space3_picture_1 = FactoryGirl.create :image,
                                   location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic6.jpg')),
                                   space_id:user2_space3.id
# user3 have 3 spaces
user3_space1 = FactoryGirl.create :space,
                                   user_id:user3.id,
                                   name:"TWS",
                                   number: "40",
                                   postal_code: 'M5V 3C1'

user3_space1_picture_1 = FactoryGirl.create :image,
                                   location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic7.jpg')),
                                   space_id:user3_space1.id

user3_space2 = FactoryGirl.create :space,
                                   user_id:user3.id,
                                   name:"Linkedin",
                                   number: "32",
                                   postal_code: 'M5B 2L7'

user3_space2_picture_1 = FactoryGirl.create :image,
                                   location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic8.jpg')),
                                   space_id:user3_space2.id

user3_space3 = FactoryGirl.create :space,
                                  user_id:user3.id,
                                  name:"Facebook",
                                  number: "32",
                                  postal_code: 'H2W 2R2'

user3_space3_picture_1 = FactoryGirl.create :image,
                                  location_picture:File.new(Rails.root.join('app', 'assets', 'images', 'pic9.jpg')),
                                  space_id:user3_space3.id


# user1 have 1 lease for user2's space 1
user1_lease1_user2_space1 = FactoryGirl.create :lease,
                                               user_id: user1.id,
                                               space_id: user2_space1.id,
                                               status_id: pending.id
# user2 have 1 lease for user3's space 2
user2_lease1_user3_space2 = FactoryGirl.create :lease,
                                               user_id: user2.id,
                                               space_id: user3_space2.id,
                                               status_id: pending.id

# chat room start from user1 to user2
chat_room_user1_To_user2 = FactoryGirl.create :room,
                                              user1_id:user1.id,
                                              user2_id:user2.id

# messages in chat room with user1 and user2
message1 = FactoryGirl.create :message,
                              content: "hello from Ian to Wes",
                              user_id: user1.id,
                              room_id: chat_room_user1_To_user2.id

message2 = FactoryGirl.create :message,
                              content: "hello from Wes to Ian",
                              user_id: user2.id,
                              room_id: chat_room_user1_To_user2.id

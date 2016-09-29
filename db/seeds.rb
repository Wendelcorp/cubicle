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


# create 3 users
# sign in(email: user1@example.com, password 123456) funther details look
# test/factories/user.rb
user1 = FactoryGirl.create :user, first_name: 'first', last_name: 'user'
#email: user2@example.com, password 123456
user2 = FactoryGirl.create :user, first_name: 'second', last_name: 'user'
#email: user3@example.com, password 123456
user3 = FactoryGirl.create :user, first_name: 'third', last_name: 'user'


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
# user1 have no space
# user2 have 1 space
user2_space1 = FactoryGirl.create :space,
                                   user_id:user2.id,
                                   name:"user2's space1",
                                   number: "21"

user2_space1_picture = FactoryGirl.create :image,
                                   space_id:user2_space1.id
# user3 have 2 spaces
user3_space1 = FactoryGirl.create :space,
                                   user_id:user3.id,
                                   name:"user3's space1",
                                   number: "31"

user3_space1_picture = FactoryGirl.create :image,
                                   space_id:user3_space1.id

user3_space2 = FactoryGirl.create :space,
                                   user_id:user3.id,
                                   name:"user3's space1",
                                   number: "32"

user3_space2_picture = FactoryGirl.create :image,
                                   space_id:user3_space2.id

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

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_girl_rails'


# Genereting Some fake datas in seed file by using factory girl, data will
# be invalid once we put it as production since factorygirl is loaded in
# testing environemnt but not production, will try to find a way to get around

# clear out data, better run rake db:setup
Lease.delete_all
User.delete_all
Space.delete_all
Address.delete_all


# create 3 users
# sign in(email: user1@example.com, password 123456) funther details look
# test/factories/user.rb
user1 = FactoryGirl.create :user
#email: user2@example.com, password 123456
user2 = FactoryGirl.create :user
#email: user3@example.com, password 123456
user3 = FactoryGirl.create :user


# create 4 status, only generate once never destory and never rerun
unless Status.exists?
  # create 4 status codes
  sent = FactoryGirl.create :status, name: 'sent'
  pending = FactoryGirl.create :status, name: 'pending'
  accept = FactoryGirl.create :status, name: 'accept'
  reject = FactoryGirl.create :status, name: 'reject'
end

=begin
create addresses : Those are not real stresses, probably cant use in
                Google Map, but those are just test sample data
=end

# user1 have no space, so no address
# user2 have 1 space, so 1 address
user2_space1_address1 = FactoryGirl.create :address, number: 1
# user3 have 2 spaces, so 2 address
user3_space1_address1 = FactoryGirl.create :address, number: 2
user3_space2_address2 = FactoryGirl.create :address, number: 3


# now create spaces
# user1 have no space
# user2 have 1 space
user2_space1 = FactoryGirl.create :space,
                                   name: "user2's space1",
                                   address_id:user2_space1_address1.id
# user3 have 2 spaces
user3_space1 = FactoryGirl.create :space,
                                   name: "user3's space1",
                                   address_id:user3_space1_address1.id
user3_space2 = FactoryGirl.create :space,
                                   name: "user3's space1",
                                   address_id:user3_space2_address2.id

# user1 have 1 lease for user2's space 1
user1_lease1_user2_space1 = FactoryGirl.create :lease,
                                               user_id: user1.id,
                                               space_id: user2_space1.id,
                                               status_id: sent.id
# user2 have 1 lease for user3's space 2
user2_lease1_user3_space2 = FactoryGirl.create :lease,
                                               user_id: user2.id,
                                               space_id: user3_space2.id,
                                               status_id: sent.id

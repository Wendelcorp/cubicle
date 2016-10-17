# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Genereting Some fake data in seed file by using factory girl, data will
# be invalid once we put it as production since factorygirl is loaded in
# testing environemnt but not production, will try to find a way to get around

# clear out data, better run rake db:setup
Lease.delete_all
User.delete_all
Space.delete_all
Room.delete_all
Message.delete_all

unless Status.exists?
  # create 4 status codes
  Status.create(name: "pending")
  Status.create(name: "accept")
  Status.create(name: "reject")
end

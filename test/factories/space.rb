#user faker to generate some test data

FactoryGirl.define do
  factory :space do
    name              {}
    available_desks   '20'
    description       'Hello'
    price             { %w(5 10 15).sample }
    user_id           {}
    number            {}
    street_name       {['Yonge st', 'Queen st', 'King st'].sample}
    city              'Toronto'
    province          'On'
    postal_code       'i9d9d0'
  end
end

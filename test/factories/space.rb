FactoryGirl.define do
  factory :space do
    name              {}
    available_desks   '20'
    description       'Hello'
    price             { %w(5 10 15).sample }
    address_id        {}
    user_id           {}
  end
end

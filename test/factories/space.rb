#user faker to generate some test data

FactoryGirl.define do
  factory :space do
    name              {}
    available_desks   '20'
    description       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada erat non ex aliquam semper. Nam iaculis metus varius sapien facilisis, id sollicitudin arcu porta. In faucibus tristique nibh.'
    price             { %w(300.00 350.00 400.00 475.23).sample }
    user_id           {}
    number            {}
    street_name       {['Yonge st', 'Queen st', 'King st'].sample}
    city              'Toronto'
    province          'On'
    postal_code       {}
  end
end

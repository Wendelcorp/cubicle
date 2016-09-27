FactoryGirl.define do
  factory :address do
    number          {}
    street_name     {['Yonge st', 'Queen st', 'King st'].sample}
    city            'Toronto'
    province        'On'
    postal_code     'i9d9d0'
  end
end

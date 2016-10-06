FactoryGirl.define do
  factory :user do
     first_name      {}
     last_name       {}
     sequence(:email){|n| "user#{n}@example.com" }
     password              "123456"
     password_confirmation "123456"
     online         'false'
  end
end

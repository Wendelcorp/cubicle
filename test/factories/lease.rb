FactoryGirl.define do
  factory :lease do
    desks         '5'
    month         '6'
    user_id       {}
    status_id     {}
    space_id      {}
  end
end

FactoryGirl.define do
  factory :image do
    location_picture {File.new(Rails.root.join('app', 'assets', 'images', 'default.jpg'))}
    space_id {}
  end
end

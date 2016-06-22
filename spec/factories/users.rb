FactoryGirl.define do
  sequence :email do |n|
    "#{Faker::Internet.user_name}-#{n}@example.com"
  end

  factory :user do
    name Faker::Name.name
    email
  end
end

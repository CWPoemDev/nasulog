FactoryGirl.define do
  sequence :email do |n|
    "#{Faker::Internet.user_name}-#{n}@example.com"
  end

  factory :user do
    name { Faker::Name.name }
    email
    icon_url { Faker::Avatar.image(Faker::Lorem.word, "128x128", "jpg") }
  end
end

FactoryGirl.define do
  factory :poem do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraphs.join "\n"
    association :user, factory: :user

    trait :now do
      created_at Time.now
    end

    trait :one_hour_ago do
      created_at 1.hours.ago
    end

    trait :tow_hour_ago do 
      created_at 2.hours.ago
    end
  end
end

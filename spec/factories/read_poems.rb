FactoryGirl.define do
  factory :read_poem do
    association :poem, factory: :poem
    association :user, factory: :user
  end
end

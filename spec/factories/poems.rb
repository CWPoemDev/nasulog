FactoryGirl.define do
  factory :poem do
    title "hogehoge"
    description "fugafuga"
    association :user, factory: :user
  end
end

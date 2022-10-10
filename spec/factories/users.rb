require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name { Faker::Name.first_name }
    role { 1 }
  end

  trait :admin do
    role { 0 }
  end

  trait :member do
    role { 1 }
  end
end

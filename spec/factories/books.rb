require 'faker'

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author
    category
  end
end

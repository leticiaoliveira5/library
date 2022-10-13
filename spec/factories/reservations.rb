FactoryBot.define do
  factory :reservation do
    user
    book
    status { 'active' }
    devolution { 1.week.from_now }

    trait :overdue do
      devolution { 2.days.ago }
    end
  end
end

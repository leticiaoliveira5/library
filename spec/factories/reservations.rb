FactoryBot.define do
  factory :reservation do
    user { user }
    book { book }
    status { 'active' }
    devolution { 1.week.from_now }
  end
end

FactoryBot.define do
  factory :event do
    title { "Sample Event" }
    description { "Event Description" }
    address { "123 Event St" }
    datetime { 1.day.from_now }
    association :user
  end
end

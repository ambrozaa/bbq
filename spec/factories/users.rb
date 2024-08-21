FactoryBot.define do
  factory :user do
    name { "John_#{rand(999)}" }
    sequence(:email) { |n| "someguy_#{n}@example.com" }
    password { "password" }
  end
end
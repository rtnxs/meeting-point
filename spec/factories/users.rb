FactoryBot.define do
  factory :user do
    name { "Dude_#{rand(999)}" }
    sequence(:email) { |n| "mail_#{n}@example.com" }
    after(:build) { |u| u.password_confirmation = u.password = "123456" }
  end
end
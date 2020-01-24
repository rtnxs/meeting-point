FactoryBot.define do
  factory :event do
    title { "MegoParty_#{rand(999)}" }
    description { 'testtesttest' }
    address { 'somewhere' }
    datetime { DateTime.current }
    created_at { Time.current }
    pincode { 123 }
    association :user
  end
end
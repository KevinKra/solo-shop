FactoryBot.define do
  factory :item do
    name  { Faker::Name.first_name + " Jacket" }
    description { Faker::Marketing.buzzwords }
    price { Faker::Number.between(from: 1000, to: 50000) }
    image { "https://www.rlmedia.io/is/image/PoloGSI/s7-1352117_lifestyle?$rl_506_630$" }
    gender { Faker::Number.between(from: 0, to: 2) }
    active { true }
    inventory { 100 }
  end
end
FactoryBot.define do
  factory :item do
    name  { Faker::Name.first_name + " Jacket" }
    description { Faker::Marketing.buzzwords }
    price { Faker::Number.between(from: 1000, to: 50000) }
    image { "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588" }
    gender { Faker::Number.between(from: 0, to: 2) }
    active { true }
    inventory { 100 }
  end
end
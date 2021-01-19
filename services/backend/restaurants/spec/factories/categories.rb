FactoryBot.define do
  factory :category do
    name { Faker::Address.country }
    identifier { name.gsub(' ', '').underscore }
  end
end

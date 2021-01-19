# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    name { Faker::Name.first_name }
    identifier { name.gsub(' ', '').underscore }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    url { Faker::Internet.url }
    image_url { Faker::Internet.url }
    price { '$' }
    rating { 1 }
    review_count { 1 }
    phone { Faker::PhoneNumber.phone_number }
    categories { [] }
    city { Faker::Address.city }
    zipcode { Faker::Address.zip_code }
    country { Faker::Address.country }
    address { Faker::Address.full_address }
    photos { [] }
  end
end

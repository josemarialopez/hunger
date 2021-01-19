# Serializer for restaurants
class CategorySerializer < ActiveModel::Serializer
  attributes :identifier, :name, :permitted_countries, :blocked_countries
end

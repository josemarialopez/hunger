# Serializer for restaurants
class CategorySerializer < ActiveModel::Serializer
  attributes :identifier, :name
end

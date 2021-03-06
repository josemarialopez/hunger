# Serializer for restaurants
class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :identifier, :latitude, :longitude, :url, :image_url, :price, :rating, :review_count, :city,
             :zipcode, :country, :address, :phone, :photos, :categories, :distance
end

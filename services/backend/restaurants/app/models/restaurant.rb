# ActiveModel that represents the Restaurant model
class Restaurant
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :id, :name, :identifier, :latitude, :longitude, :url, :image_url, :price, :rating, :review_count, :city,
                :zipcode, :country, :address, :phone, :photos, :categories, :distance

  def self.search(params = {})
    data = Yelp::Manager.instance.search_restaurants(params)
    data[:businesses].map do |element|
      parse(element)
    end
  end

  def self.parse(data)
    new(
        id: data[:id],
        name: data[:name],
        identifier: data[:alias],
        latitude: data[:coordinates][:latitude],
        longitude: data[:coordinates][:longitude],
        url: data[:url],
        image_url: data[:image_url],
        price: data[:price],
        rating: data[:rating],
        review_count: data[:review_count],
        city: data[:location][:city],
        zipcode: data[:location][:zip_code],
        country: data[:location][:country],
        address: data[:location][:display_address],
        phone: data[:display_phone],
        distance: data[:distance],
        categories: data[:categories].map{ |category| category[:title] }
      )
  end
end

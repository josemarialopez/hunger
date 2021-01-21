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





# [
#       Restaurant.new(
#         id: 'rQSFuKAyrkZtRRdOnJglJQ',
#         identifier: 'el-sur-madrid',
#         name: 'El Sureno',
#         image_url: 'https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg',
#         url: 'https://www.yelp.com/biz/el-sur-madrid?adjust_creative=tV7D2uC5doCo6VWJF9Vtrg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=tV7D2uC5doCo6VWJF9Vtrg',
#         phone: '+34 915 27 83 40',
#         review_count: 662,
#         categories: ['Tapas Bars', 'Italian', 'American'],
#         rating: 4.5,
#         city: 'Madrid',
#         zipcode: '28012',
#         country: 'ES',
#         address: 'Calle de la Torrecilla del Leal, 12. 28012 Madrid. Spain',
#         latitude: 40.4110475,
#         longitude: -3.6995454,
#         photos: ['https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg', 'https://s3-media2.fl.yelpcdn.com/bphoto/9NhGe0qp0XGGX_akVPUN7g/o.jpg', 'https://s3-media4.fl.yelpcdn.com/bphoto/HDSc745VKdAdayaoTQ72fg/o.jpg'],
#         price: '$$',
#         distance: 3
#       ),

#       Restaurant.new(
#         id: 'rQSFuKAyrkZtRRdOnJglJQ',
#         identifier: 'el-sur-madrid',
#         name: 'El norteno',
#         image_url: 'https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg',
#         url: 'https://www.yelp.com/biz/el-sur-madrid?adjust_creative=tV7D2uC5doCo6VWJF9Vtrg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=tV7D2uC5doCo6VWJF9Vtrg',
#         phone: '+34 915 27 83 40',
#         review_count: 662,
#         categories: ['Tapas Bars', 'Italian', 'American'],
#         rating: 4.5,
#         city: 'Madrid',
#         zipcode: '28012',
#         country: 'ES',
#         address: 'Calle de la Torrecilla del Leal, 12. 28012 Madrid. Spain',
#         latitude: 40.4110475,
#         longitude: -3.6995454,
#         photos: ['https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg', 'https://s3-media2.fl.yelpcdn.com/bphoto/9NhGe0qp0XGGX_akVPUN7g/o.jpg', 'https://s3-media4.fl.yelpcdn.com/bphoto/HDSc745VKdAdayaoTQ72fg/o.jpg'],
#         price: '$$',
#         distance: 3
#       )
#     ]
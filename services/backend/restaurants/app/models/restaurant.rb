# ActiveModel that represents the Restaurant model
class Restaurant
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :id, :name, :alias, :latitude, :longitude, :url, :image_url, :price, :rating, :review_count, :city,
                :zipcode, :country, :address, :phone, :photos, :categories, :distance

  def self.search(params = {})
    [
      Restaurant.new(
        id: 'rQSFuKAyrkZtRRdOnJglJQ',
        alias: 'el-sur-madrid',
        name: 'El Sureno',
        image_url: 'https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg',
        url: 'https://www.yelp.com/biz/el-sur-madrid?adjust_creative=tV7D2uC5doCo6VWJF9Vtrg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=tV7D2uC5doCo6VWJF9Vtrg',
        phone: '+34 915 27 83 40',
        review_count: 662,
        categories: ['Tapas Bars', 'Italian', 'American'],
        rating: 4.5,
        city: 'Madrid',
        zipcode: '28012',
        country: 'ES',
        address: 'Calle de la Torrecilla del Leal, 12. 28012 Madrid. Spain',
        latitude: 40.4110475,
        longitude: -3.6995454,
        photos: ['https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg', 'https://s3-media2.fl.yelpcdn.com/bphoto/9NhGe0qp0XGGX_akVPUN7g/o.jpg', 'https://s3-media4.fl.yelpcdn.com/bphoto/HDSc745VKdAdayaoTQ72fg/o.jpg'],
        price: '$$',
        distance: 3
      ),

      Restaurant.new(
        id: 'rQSFuKAyrkZtRRdOnJglJQ',
        alias: 'el-sur-madrid',
        name: 'El norteno',
        image_url: 'https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg',
        url: 'https://www.yelp.com/biz/el-sur-madrid?adjust_creative=tV7D2uC5doCo6VWJF9Vtrg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=tV7D2uC5doCo6VWJF9Vtrg',
        phone: '+34 915 27 83 40',
        review_count: 662,
        categories: ['Tapas Bars', 'Italian', 'American'],
        rating: 4.5,
        city: 'Madrid',
        zipcode: '28012',
        country: 'ES',
        address: 'Calle de la Torrecilla del Leal, 12. 28012 Madrid. Spain',
        latitude: 40.4110475,
        longitude: -3.6995454,
        photos: ['https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg', 'https://s3-media2.fl.yelpcdn.com/bphoto/9NhGe0qp0XGGX_akVPUN7g/o.jpg', 'https://s3-media4.fl.yelpcdn.com/bphoto/HDSc745VKdAdayaoTQ72fg/o.jpg'],
        price: '$$',
        distance: 3
      )
    ]
    # YelpManager.instance.search(params)
  end


  private

  def self.parse(data)

  end
end

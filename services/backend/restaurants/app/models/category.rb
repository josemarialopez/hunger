class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :alias, type: String
end

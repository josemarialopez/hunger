class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :identifier, type: String

  validates :name, presence: true, uniqueness: true
  validates :identifier, presence: true, uniqueness: true
end

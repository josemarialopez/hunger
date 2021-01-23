class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :identifier, type: String
  field :main, type: Boolean

  validates :name, presence: true, uniqueness: true
  validates :identifier, presence: true, uniqueness: true

  scope :main, -> { where(main: true) }
end

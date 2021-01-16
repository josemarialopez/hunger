class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  # Fields definition
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
end

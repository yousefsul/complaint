class User

=begin
  class User
    define user attribute email,password and admin for registration and login
    admin attribute default as false
    using the activemodel to secure the user password
    email and password can't be blank
    each user can have multiple complains
=end
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include ActiveModel::SecurePassword
  field :email, type: String
  field :password_digest, type: String
  field :admin, type: Mongoid::Boolean, default: false

  validates :email, presence: true, uniqueness: true
  has_secure_password validations: false
  has_many :complains

end

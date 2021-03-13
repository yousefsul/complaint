class User

=begin
  class User
    define user attribute email,password and admin for registration and login
    admin attribute default as false
    using the activemodel to secure the user password
    email and password can't be blank
=end
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include ActiveModel::SecurePassword
  field :email, type: String
  field :password_digest, type: String


  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

end

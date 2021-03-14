class Complain
  include Mongoid::Document
=begin
add complaint model
each complaint will have title and body
and status where user can just see it
each complaint belong to one user
=end
  field :title, type: String
  field :body, type: String
  field :status, type: String, default: "pending"

  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
end

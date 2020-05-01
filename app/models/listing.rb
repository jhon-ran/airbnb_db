class Listing < ApplicationRecord
  has_many :reservations
  belongs_to :city
  belongs_to :admin, class_name: "User"
end
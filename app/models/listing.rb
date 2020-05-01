class Listing < ApplicationRecord
  belongs_to :city
  belongs_to :admin, foreign_key: 'admin_id', class_name: 'User'
  has_many :reservations
  has_many :users, through: :reservations
end

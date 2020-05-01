class User < ApplicationRecord
  has_many :reservations, foreign_key: 'guest_id'
  has_many :listings, foreign_key: 'admin_id'
end
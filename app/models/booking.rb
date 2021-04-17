class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :truck_route
end

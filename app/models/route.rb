class Route < ApplicationRecord
  belongs_to :origin, class_name: 'Location', foreign_key: :origin_id
  belongs_to :destination, class_name: 'Location', foreign_key: :destination_id

  has_many :truck_routes
  has_many :trucks, through: :truck_routes
end

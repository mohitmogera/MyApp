class TruckRoute < ApplicationRecord
  belongs_to :truck
  belongs_to :route

  # has_many :trucks
  # has_many :routes 
end

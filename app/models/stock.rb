class Stock < ActiveRecord::Base
  attr_accessible :ticker
  has_many :data_points
end

class Trip < ApplicationRecord
  serialize :points, Array
  serialize :times, Array

  # belongs_to :route
end

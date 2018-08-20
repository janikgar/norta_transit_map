class Trip < ApplicationRecord
  serialize :points, Array
  serialize :times, Array
end

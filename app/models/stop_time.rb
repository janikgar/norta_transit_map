class StopTime < ApplicationRecord
    has_many :trips
    has_many :stops
end

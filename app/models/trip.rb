class Trip < ApplicationRecord
    belongs_to :route
    belongs_to :stop_time
    belongs_to :calendar
    has_and_belongs_to_many :shapes
end

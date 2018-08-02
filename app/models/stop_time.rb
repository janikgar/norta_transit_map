class StopTime < ApplicationRecord
    belongs_to :trip#, foreign_key: :trip_id
    belongs_to :stop#, foreign_key: :stop_id
end

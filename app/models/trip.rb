class Trip < ApplicationRecord
    belongs_to :route#, foreign_key: :route_id
    belongs_to :calendar, foreign_key: :service_id
end

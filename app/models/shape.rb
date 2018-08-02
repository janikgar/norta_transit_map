class Shape < ApplicationRecord
    belongs_to :trip#, foreign_key: :trip_id
end

class Station < ApplicationRecord
    belongs_to :building, optional: true
end
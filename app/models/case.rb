class Case < ApplicationRecord
    has_many :stations
    accepts_nested_attributes_for :stations, allow_destroy: true
    validates :title, presence: true
    validates :charge, presence: true
    validates :address, presence: true
    validates :age, presence: true
end
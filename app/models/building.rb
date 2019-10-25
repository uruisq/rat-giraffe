class Building < ApplicationRecord
    has_many :stations, inverse_of: :building
    accepts_nested_attributes_for :stations, allow_destroy: true
    validates :title, presence: true
    validates :charge, presence: true
    validates :address, presence: true
    validates :age, presence: true
end
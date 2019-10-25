class Building < ApplicationRecord
    has_many :stations, dependent: :destroy, inverse_of: :building
    accepts_nested_attributes_for :stations, reject_if: :reject_station, allow_destroy: true
    validates :title, presence: true
    validates :charge, presence: true
    validates :address, presence: true
    validates :age, presence: true

    def reject_station(attributes)
    exists = attributes[:id].present?
    empty = attributes[:line].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
    end
end
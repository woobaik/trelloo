class Card < ApplicationRecord
    has_many :lists, -> { order(position: :asc) }
    
    validates :name, presence: true
end

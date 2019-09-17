class Card < ApplicationRecord
    acts_as_list
    has_many :lists, -> { order(position: :asc) }
    
    validates :name, presence: true
end

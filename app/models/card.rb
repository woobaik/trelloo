class Card < ApplicationRecord
    default_scope { order(position: :asc)}
    has_many :lists, -> { order(position: :asc) }, dependent: :destroy
    acts_as_list

    
    validates :name, presence: true
end

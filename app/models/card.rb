class Card < ApplicationRecord
    has_many :lists, -> { order(updated_at: :asc) }, dependent: :destroy
    acts_as_list

    
    validates :name, presence: true
end

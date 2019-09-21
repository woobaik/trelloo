class List < ApplicationRecord
  belongs_to :card
  
  
default_scope { order(position: :asc)}
  acts_as_list scope: :card
end

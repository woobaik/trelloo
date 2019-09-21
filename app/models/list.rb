class List < ApplicationRecord
  belongs_to :card
  
  
  acts_as_list scope: :card
end

class List < ApplicationRecord
  belongs_to :card
  belongs_to :user

  acts_as_list scope: :card
end

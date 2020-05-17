class StateChange < ApplicationRecord

  include Commentable
  
  belongs_to :state_changeable, polymorphic: true
  # belongs_to :person

  validates :person_id, presence: true
end

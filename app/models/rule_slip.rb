class RuleSlip < ApplicationRecord

  include StateChangeable

  belongs_to :rule
  belongs_to :slip

  aasm do
    state :active, initial: true
    state :retired
  
    event :retire do
      transitions from: :active, to: :retired do
        guard { state_change_for(:retire) }
      end
    end
  end
  
end

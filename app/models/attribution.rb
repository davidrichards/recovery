class Attribution < ApplicationRecord

  includes StateChangeable

  belongs_to :attributable, polymorphic: true

  validates :label, presence: true

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

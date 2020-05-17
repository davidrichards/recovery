class Slip < ApplicationRecord

include StateChangeable

  # belongs_to :creator, class_name: "Person"
  belongs_to :source

  has_many :rule_slips
  has_many :rules, through: :rule_slips

  validates :name, :body, presence: true

  aasm do
    state :staged, initial: true
    state :active, :rejected, :retired
  
    event :activate do
      transitions from: :staged, to: :active do
        guard { state_change_for(:activate) }
      end
    end
  
    event :reject do
      transitions from: :staged, to: :rejected do
        guard { state_change_for(:reject) }
      end
    end
  
    event :retire do
      transitions from: [:staged, :active], to: :retired do
        guard { state_change_for(:retire) }
      end
    end
  end  

end

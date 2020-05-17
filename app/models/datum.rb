class Datum < ApplicationRecord

  include StateChangeable

  belongs_to :processor
  belongs_to :reference, polymorphic: true, optional: true

  validates :label, presence: true
  validate :some_value?

  aasm do
    state :active, initial: true
    state :retired
  
    event :retire do
      transitions from: :active, to: :retired do
        guard { state_change_for(:retire) }
      end
    end
  end  

  private

  def some_value?
    [float_value, integer_value, string_value, text_value].any?
  end
end

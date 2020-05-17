class Comment < ApplicationRecord

  include StateChangeable
  
  belongs_to :commentable, polymorphic: true

  validates :title, :body, :creator_id, :commentable, presence: true

  aasm do
    state :personal, initial: true
    state :public
  
    event :make_public do
      transitions from: :personal, to: :public do
        guard { state_change_for(:make_public) }
      end
    end
  end
  
end

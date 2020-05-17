module StateChangeable

  # TODO: Also check ability of current_user to make the state change.
  # TODO: Use the person association, when it's built.
  extend ActiveSupport::Concern

  included do
    include AASM
    has_many :state_changes, -> { order(:created_at) }, as: :state_changeable

    attr_accessor :current_user

    # Can be used like: guard: { state_change_for(:active) }
    # Will save with the record that is being changed.
    def state_change_for(role_name)
      return false unless current_user
      model = StateChange.new(
        state_changeable: self,
        person_id: current_user.id,
        role_name: role_name
      )
      return false unless model.valid?
      self.state_changes << model
      model
    end

  end

end
module Reference

  extend ActiveSupport::Concern

  included do
    has_many :data, -> { order(:created_at) }, as: :reference
    scope :time_series, ->(label) do
      (Datum.
        where("label = ?", label).
        where(aasm_state: 'active')
      )
    end

    def time_series(label)
      (
        data.
        where("label = ?", label).
        where(aasm_state: 'active')
      )
    end
  
  end

end
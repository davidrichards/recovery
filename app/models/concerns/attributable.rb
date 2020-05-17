module Attributable
  extend ActiveSupport::Concern

  included do
    has_one :attribution, -> { order(:created_at) }, as: :attributable
  end

end
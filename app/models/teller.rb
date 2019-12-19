class Teller < ApplicationRecord
  # custom validation. we can include any complex logic for validation here
  validates_with TellerLimitValidator

  # class methods
  class << self
    # current balance
    def balance
      # fetch count of notes by each denomination
      # example: Teller.balance => {"100":25,"200":24,"500":22,"2000":1}
      group(:denomination).sum(:notes)
    end
  end
end

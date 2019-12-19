class Teller < ApplicationRecord
  # class methods
  class << self
    # current balance
    def balance
      group(:denomination).sum(:notes)
    end
  end
end

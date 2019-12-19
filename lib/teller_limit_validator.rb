# frozen_string_literal: true

# custom validator logic for Teller model
class TellerLimitValidator < ActiveModel::Validator
  # validates each record
  def validate(record)
    # denomination x notes = must be -20_000 or higher value
    # -ve means withdrawal
    # +ve means deposit
    # -ve of more than 20_000 means range exceeded
    if (record.denomination * record.notes) < -20_000
      # throw an error through active_record chain
      record.errors[:base] << "You cannot withdraw more than 20,000"
    end
  end
end

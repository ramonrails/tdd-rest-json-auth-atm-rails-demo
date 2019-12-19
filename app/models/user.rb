class User < ApplicationRecord
  # NOTE: optional password attribute because we need user to login using card & pin
  has_secure_password :password, validations: false

  # card and pin numbers can be alphanumeric too. think futuristic!
  # this wasn't in the requirement anyway :)
  # don't fix what is not broken. right?
  #
  # card number length
  validates :card, length: { is: 8 }, unless: -> { card.blank? }
  # pin number length
  validates :pin, length: { is: 4 }, unless: -> { pin.blank? }
end

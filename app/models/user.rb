class User < ApplicationRecord
  has_secure_password :password, validations: false

  validates :card, length: { is: 8 }, unless: -> { card.blank? }
  validates :pin, length: { is: 4 }, unless: -> { pin.blank? }
end

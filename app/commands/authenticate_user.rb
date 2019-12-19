# app/commands/authenticate_user.rb

class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    # simpler logic: this will double as card/pin too
    @email = email # maybe a card number
    @password = password # or a pin number
  end

  def call
    JsonWebToken::encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    # assume admin and try to find by email
    user = User.find_by_email(email)
    if user.present?
      # yes! we found an admin. Not so easy though. authenticate the password first
      # return the user record when valid admin
      # return `nil` = false when imposter
      return user if user.authenticate(password)
    else
      # so, admin auth was not requested
      # lets see if we have a user with that card and pin
      # `user` when found, `nil` = false when missing
      return User.find_by(card: email, pin: password) # email = card data, password = pin data
    end

    # did we reach here? definitely an error case
    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end

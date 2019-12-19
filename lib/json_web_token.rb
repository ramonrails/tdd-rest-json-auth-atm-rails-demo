module JsonWebToken
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV['secret_key_base'])
  end

  def self.decode(token)
    body = JWT.decode(token, ENV['secret_key_base'])[0]
    HashWithIndifferentAccess.new body
  rescue
    nil
  end

end

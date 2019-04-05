class JsonWebToken
  def self.encode(payload)
    expiration = 24.hours.from_now.to_i
    JWT.encode(payload.merge(exp: expiration), Rails.application.secrets.secret_key_base)
    # payload is a hash with a subject and user_id
    # example: JsonWebToken.encode({sub: '1'}), which returns a token that can be decoded
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base).first
    # returns an array, only the first part is relevant to the user
    # example [{"sub"=>"1"}, {"typ"=>"JWT", "alg"=>"HS256"}]. we don't need the typ or alg bits.
  end
end

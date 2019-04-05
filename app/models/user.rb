class User < ApplicationRecord
  has_secure_password

  def to_token_payload
    { sub: id,
      admin: false,
      email: email
    }
  end

end

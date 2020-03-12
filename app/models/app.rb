class App < ApplicationRecord
  include Tokenable

  before_save { self.email = email.downcase }

  validates :email, email: true, presence: true, uniqueness: true

  has_secure_password

  def valid_password?(value)
    BCrypt::Password.new(self.password_digest) == value
  end
end

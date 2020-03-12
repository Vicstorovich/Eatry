class App < ApplicationRecord
  include Tokenable

  before_save { self.email = email.downcase }

  validates :email, email: true, presence: true, uniqueness: true

  has_secure_password
end

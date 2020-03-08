class User < ApplicationRecord
  before_save :set_admin
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, email: true

  has_secure_password

  private

  def set_admin
    self.admin = User.count.zero?
  end
end

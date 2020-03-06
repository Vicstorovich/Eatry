class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :set_admin
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
             format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  private
  def set_admin
    self.admin = User.count == 0
  end
end

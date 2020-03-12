class User < ApplicationRecord
  before_save :set_admin
  before_save { self.email = email.downcase }
  before_create :build_profile, unless: -> { profile.present? }

  has_one :profile, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, email: true, presence: true, uniqueness: true

  accepts_nested_attributes_for :profile, update_only: true
  has_secure_password

  private

  def set_admin
    self.admin = User.count.zero?
  end
end

class User < ApplicationRecord
  has_secure_password

  generates_token_for :email_verification, expires_in: 2.days { email }
  generates_token_for :password_reset, expires_in: 20.minutes { password_salt.last(10) }

  has_many :sessions, dependent: :destroy
  has_many :bookings

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 8 }

  normalizes :email, with: -> { _1.strip.downcase }

  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).delete_all
  end

  def to_s
    "#{name} - #{email}"
  end
end

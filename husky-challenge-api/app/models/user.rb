class User < ApplicationRecord
  has_secure_token :auth_token

  has_many :invoices

  validates :name, presence: true
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 100 },
            format: { with: URI::MailTo::EMAIL_REGEXP }
end

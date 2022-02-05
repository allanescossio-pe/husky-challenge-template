class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :token, length: { is: 50 }, allow_blank: true
end

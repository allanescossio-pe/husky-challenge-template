class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 100 },
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :token, uniqueness: true, length: { is: 50 }, allow_blank: true
end

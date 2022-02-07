class Invoice < ApplicationRecord
  belongs_to :user

  validates :number, presence: true, uniqueness: true
  validates :issuer, presence: true, length: { maximum: 150 }
  validates :payer, presence: true, length: { maximum: 150 }
  validates :price, presence: true
  validates :due_date, presence: true
end

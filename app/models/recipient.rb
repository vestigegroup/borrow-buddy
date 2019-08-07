class Recipient < ApplicationRecord
  has_many :borrows
  has_many :items, through: :borrows

  validates_associated :borrows
  validates :name, presence: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, allow_blank: true
  validates :phone, format: { with: /\A[(]\d{3}[)] \d{3}-\d{4}\z/ }, allow_blank: true
end
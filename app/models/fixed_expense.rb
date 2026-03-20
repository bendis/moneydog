class FixedExpense < ApplicationRecord
  validates :name, presence: true
  validates :valid_from, presence: true
  validates :amount, numericality: true

  belongs_to :user

  scope :for_user, lambda { |user|
    user = User.find(user) unless user.is_a? User
    user ? where(user_id: user.id) : none
  }

  scope :valid, lambda { |date|
    where("valid_from <= ? AND (valid_to >= ? OR valid_to IS NULL)", date.to_date, date.to_date)
  }
end

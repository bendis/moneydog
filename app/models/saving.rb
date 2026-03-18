class Saving < ApplicationRecord
  validates :amount, numericality: true

  belongs_to :user

  scope :for_user, lambda { |user|
    user = User.find(user) unless user.is_a? User
    user ? where(user_id: user.id) : none
  }
end

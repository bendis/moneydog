class Income < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: true

  belongs_to :user

  scope :for_user, lambda { |user|
    user = User.find(user) unless user.is_a? User
    user ? where(user_id: user.id) : none
  }

  scope :current_month, lambda {
    where(date: Date.today.beginning_of_month..Date.today.end_of_month)
  }

  scope :all_for_week, lambda { |i|
    i = i + 1
    beginning_of_week = Date.new(Time.now.year, Time.now.month, ((i * 7) - 6))
    end_of_week = Date.new(Time.now.year, Time.now.month, (i * 7))
    where(date: beginning_of_week..end_of_week)
  }

  scope :month, lambda { |date_string|
    d = date_string.to_date
    where(date: d.beginning_of_month..d.end_of_month)
  }

  scope :all_for_week_in_month, lambda { |i, date_string|
    i = i + 1
    d = date_string.to_date
    beginning_of_week = Date.new(d.year, d.month, ((i * 7) - 6))
    end_of_week = Date.new(d.year, d.month, (i * 7))
    where(date: beginning_of_week..end_of_week)
  }
end

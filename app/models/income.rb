class Income < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :amount

  named_scope :current_month, lambda {
    {:conditions => ["created_at >= ?",
      Date.today.beginning_of_month]}
  }

end

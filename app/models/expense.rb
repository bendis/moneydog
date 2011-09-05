class Expense < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :price

  named_scope :current_month, lambda {
    {:conditions => ["created_at >= ?",
      Date.today.beginning_of_month]}
  }

end

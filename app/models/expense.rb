class Expense < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :price

  named_scope :current_month, lambda {
    {:conditions => ["created_at >= ?",
      Date.today.beginning_of_month]}
  }
  named_scope :all_for_week, lambda { |i|
    i = i+1
    puts Date.new(Time.now.year,Time.now.month,((i*7)-6))
    beginning_of_week = Date.new(Time.now.year,Time.now.month,((i*7)-6))
    end_of_week = Date.new(Time.now.year,Time.now.month,(i*7))
    {:conditions => ["created_at >= ? AND created_at <= ?",
      beginning_of_week, end_of_week]}
  }

end

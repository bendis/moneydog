class Expense < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :price
  
  belongs_to :user
  
  default_scope :order => "date DESC"
  
  named_scope :for_user, lambda { |user|
    user = User.find(user) unless user.is_a? User
    user ? { :conditions => { :user_id => user.id } } : {}
  }

  named_scope :current_month, lambda {
    {:conditions => ["date >= ?",
      Date.today.beginning_of_month]}
  }
  named_scope :all_for_week, lambda { |i|
    i = i+1
    puts Date.new(Time.now.year,Time.now.month,((i*7)-6))
    puts Date.new(Time.now.year,Time.now.month,(i*7))
    beginning_of_week = Date.new(Time.now.year,Time.now.month,((i*7)-6))
    end_of_week = Date.new(Time.now.year,Time.now.month,(i*7))
    {:conditions => ["date >= ? AND date <= ?",
      beginning_of_week.to_s(:db), end_of_week.to_s(:db)]}
  }
  
  named_scope :not_from_savings, {:conditions => ["from_savings = ?", false]}
  

end

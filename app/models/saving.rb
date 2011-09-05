class Saving < ActiveRecord::Base
  validates_numericality_of :amount
  
  named_scope :current, lambda {
    {:conditions => ["created_at >= ?",
      Time.now]}
  }
end

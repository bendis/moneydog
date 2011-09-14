class Saving < ActiveRecord::Base
  validates_numericality_of :amount
  belongs_to :user
  
  named_scope :for_user, lambda { |user|
    user = User.find(user) unless user.is_a? User
    user ? { :conditions => { :user_id => user.id } } : {}
  }
  
  named_scope :current, lambda {
    {:conditions => ["created_at >= ?",
      Time.now]}
  }
end

class FixedExpense < ActiveRecord::Base
  validates_presence_of :name, :valid_from
  validates_numericality_of :amount
  belongs_to :user
  
  named_scope :for_user, lambda { |user|
    user = User.find(user) unless user.is_a? User
    user ? { :conditions => { :user_id => user.id } } : {}
  }
  
  named_scope :valid, lambda { |date|
    {:conditions => ["valid_from <= ? AND (valid_to >= ? OR valid_to IS ?)", date.to_date, date.to_date, nil]}
  }
  
end

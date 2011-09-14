class FixedIncome < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :amount
  belongs_to :user
  
  named_scope :for_user, lambda { |user|
    user = User.find(user) unless user.is_a? User
    user ? { :conditions => { :user_id => user.id } } : {}
  }
  
end

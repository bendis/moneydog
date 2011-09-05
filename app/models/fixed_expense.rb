class FixedExpense < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :amount
  
end

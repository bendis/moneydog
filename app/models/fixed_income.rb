class FixedIncome < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :amount
end

class AddFromSavingsToExpense < ActiveRecord::Migration
  def self.up
    add_column :expenses, :from_savings, :boolean, :default => false
  end

  def self.down
    remove_column :expenses, :from_savings
  end
end

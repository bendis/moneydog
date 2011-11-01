class AddValiditiesToFixedExpense < ActiveRecord::Migration
  def self.up
    add_column :fixed_expenses, :valid_from, :datetime, :nil => true
    add_column :fixed_expenses, :valid_to, :datetime, :nil => true
  end

  def self.down
    remove_column :fixed_expenses, :valid_from
    remove_column :fixed_expenses, :valid_to
  end
end

class AddUserReferenceToModels < ActiveRecord::Migration
  def self.up
    add_column :expenses, :user_id, :integer
    add_column :fixed_expenses, :user_id, :integer
    add_column :fixed_incomes, :user_id, :integer
    add_column :incomes, :user_id, :integer
    add_column :savings, :user_id, :integer
  end

  def self.down
    remove_column :expenses, :user_id
    remove_column :fixed_expenses, :user_id
    remove_column :fixed_incomes, :user_id
    remove_column :incomes, :user_id
    remove_column :savings, :user_id
  end
end

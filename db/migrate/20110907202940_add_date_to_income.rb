class AddDateToIncome < ActiveRecord::Migration
  def self.up
    add_column :incomes, :date, :date
  end

  def self.down
    remove_column :incomes, :date
  end
end

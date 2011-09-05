class CreateFixedExpenses < ActiveRecord::Migration
  def self.up
    create_table :fixed_expenses do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :fixed_expenses
  end
end

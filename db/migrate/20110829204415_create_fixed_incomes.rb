class CreateFixedIncomes < ActiveRecord::Migration
  def self.up
    create_table :fixed_incomes do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :fixed_incomes
  end
end

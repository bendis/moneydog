class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.string :name
      t.float :price
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end

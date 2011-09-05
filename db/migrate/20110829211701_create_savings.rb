class CreateSavings < ActiveRecord::Migration
  def self.up
    create_table :savings do |t|
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :savings
  end
end

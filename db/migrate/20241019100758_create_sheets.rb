class CreateSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :sheets do |t|
      t.integer :column, null: false, limit: 1  # limit: 1 を指定して TINYINT 相当
      t.string :row, null: false, limit: 1      # VARCHAR(1) 相当

      t.timestamps
    end
  end
end

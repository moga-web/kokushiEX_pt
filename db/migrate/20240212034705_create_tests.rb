class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.integer :year, null: false
      t.string :session, null: false
      t.integer :pass_mark, null: false

      t.timestamps
    end
  end
end

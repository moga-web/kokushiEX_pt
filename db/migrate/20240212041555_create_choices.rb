class CreateChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :choices do |t|
      t.references :question, null: false, foreign_key: true
      t.string :content, null: false
      t.boolean :is_correct, default: false
      
      t.timestamps
    end
  end
end

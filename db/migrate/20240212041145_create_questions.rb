class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.references :test, null: false, foreign_key: true
      t.text :content, null: false
      t.string :image_url

      t.timestamps
    end
  end
end

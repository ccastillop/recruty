class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.references :question
      t.text :body
      t.integer :score, default: 0

      t.timestamps
    end
  end
end

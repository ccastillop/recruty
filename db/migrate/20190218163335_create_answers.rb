class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :user
      t.references :questionnarie
      t.references :question
      t.references :choice
      t.text :body
      t.integer :score, default: 0

      t.timestamps
    end
  end
end

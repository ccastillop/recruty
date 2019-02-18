class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :questionaire
      t.string :kind
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end

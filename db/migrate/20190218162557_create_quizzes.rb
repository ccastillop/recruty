class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.references :user
      t.references :questionnaire
      t.string :state

      t.timestamps
    end
  end
end

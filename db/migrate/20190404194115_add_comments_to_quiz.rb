class AddCommentsToQuiz < ActiveRecord::Migration[5.2]
  def change
    add_column :quizzes, :comments, :text
  end
end

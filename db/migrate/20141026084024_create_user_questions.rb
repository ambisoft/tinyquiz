class CreateUserQuestions < ActiveRecord::Migration
  def change

    create_table :user_questions do |t|

      t.references :quiz_session, index: true
      t.references :question, index: true
      t.string :answer

      t.timestamps
    end
  end
end

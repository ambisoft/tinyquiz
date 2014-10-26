class CreateQuizSessions < ActiveRecord::Migration
  def change
    create_table :quiz_sessions do |t|

      t.string :hash_code
      t.integer :current_question_id
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end

    add_index :quiz_sessions, :hash_code, unique: true

  end
end

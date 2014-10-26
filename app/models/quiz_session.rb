require 'digest'

class QuizSession < ActiveRecord::Base

  has_many :user_questions
  belongs_to :current_question, class: UserQuestion

  def self.create_new_session

    quiz_session = QuizSession.new(hash_code: generate_hash_code)
    quiz_session.user_questions = Question.all.map do |question|
      UserQuestion.new(question: question)
    end
    quiz_session.current_question = quiz_session.user_questions.first
    quiz_session.started_at = Time.new
    quiz_session.save ? quiz_session : nil

  end

  def self.generate_hash_code
    Digest::MD5.hexdigest "#{Time.new.to_f.to_s}-#{rand(0..10000)}"
  end

  def store_answer(answer)

    if current_question
      current_question.update_attribute(:answer, answer.answer)
      sorted_questions = user_questions.order('id')
      idx = sorted_questions.index(current_question)
      self.current_question = nil
      if idx >= sorted_questions.size - 1
        self.finished_at = Time.new
      else
        self.current_question = sorted_questions[idx + 1]
      end
      save
    end

  end

end

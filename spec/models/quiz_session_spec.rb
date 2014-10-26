require 'rails_helper'

describe QuizSession do

  let(:new_session) { QuizSession.new }

  before do
    Question.create(id: 1, question: 'Q1', answer: 'T1')
    Question.create(id: 2, question: 'Q2', answer: 'T2')
    Question.create(id: 3, question: 'Q3', answer: 'T3')
  end

  it 'does not have any current questions' do
    expect(new_session.current_question).to eq nil
  end

  describe 'creating a new Quiz Session' do

    before do
      QuizSession.create_new_session
    end

    it 'populates the hash field' do
      expect(QuizSession.first.hash_code).not_to eq nil
    end

    it 'creates 3 User Questions' do
      expect(UserQuestion.count).to eq 3
    end

    it 'sets current question' do
      first_user_question = UserQuestion.order('id').first
      expect(QuizSession.first.current_question).to eq first_user_question
    end

    it 'initializes the start time' do
      expect(QuizSession.first.started_at).not_to eq nil
    end

  end

  context 'having an open session' do

    before do
      QuizSession.create_new_session
    end

    describe 'providing an answer' do

      let(:open_session) { QuizSession.first }

      before do
        answer = UserAnswer.new(answer: 'John Smith')
        open_session.store_answer(answer)
      end

      it 'advances the current question mark' do
        second_user_question = UserQuestion.order('id').second
        expect(QuizSession.first.current_question).to eq second_user_question
      end

      it 'keeps the session open' do
        expect(QuizSession.first.finished_at).to eq nil
      end

    end

  end

  context 'having an open session' do

    before do
      QuizSession.create_new_session
    end

    describe 'providing 3 answers' do

      before do
        answer = UserAnswer.new(answer: 'John Smith')
        QuizSession.first.store_answer(answer)
        QuizSession.first.store_answer(answer)
        QuizSession.first.store_answer(answer)
      end

      it 'clears the current question mark' do
        expect(QuizSession.first.current_question).to eq nil
      end

      it 'closes the session' do
        expect(QuizSession.first.finished_at).not_to eq nil
      end

    end

  end

end

class QuizzesController < ApplicationController

  def new
    @quiz_session = QuizSession.new
  end

  def show
    session_hash = session[:session_code]
    @quiz_session = QuizSession.find_by(hash_code: session_hash)
    redirect_to root_path unless @quiz_session
  end

end


class QuizSessionsController < ApplicationController

  def create
    if quiz_session = QuizSession.create_new_session
      session[:session_code] = quiz_session.hash_code
      redirect_to quiz_path
    else
      redirect_to new_quiz_path
    end
  end

end

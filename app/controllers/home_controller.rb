class HomeController < ApplicationController

  def index
    session_hash = session[:session_code]
    redirect_to quiz_path if session_hash
  end

end

class UserQuestion < ActiveRecord::Base
  belongs_to :quiz_session
  belongs_to :question
end

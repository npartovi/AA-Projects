class Response < ApplicationRecord
  validates :answer_choice_id, presence: true, uniqueness: true
  validates :question_id, presence: true, uniqueness: true

  belongs_to :answer_choice_id,
    class_name: :AnswerChoice,
    foreign_key: :answer_choice_id,
    primary_key: :id

  belongs_to :question_id,
    class_name: :Question,
    foreign_key: :question_id,
    primary_key: :id
end

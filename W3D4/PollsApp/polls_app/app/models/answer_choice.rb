class AnswerChoice < ApplicationRecord
  validates :question_id, presence: true, uniqueness: true
  validates :text, presence: true, uniqueness: true

  belongs_to :question,
    class_name: :Question,
    foreign_key: :question_id,
    primary_key: :id

  has_many :responses,
    class_name: :Responses,
    foreign_key: :answer_choice_id,
    primary_key: :id
end

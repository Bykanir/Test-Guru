# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true

  validate :validate_count_answers_for_question

  scope :correct_answer, -> { where(correct: true) }

  private

  def validate_count_answers_for_question
    errors.add(:count_answers) if question.answers.size >= 4  
  end
end

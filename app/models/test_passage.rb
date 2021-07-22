class TestPassage < ApplicationRecord

  SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_currect_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    increment(:correct_questions) if correct_answer?(answer_ids)

    save!
  end

  def test_passed?
    test_success_rate >= SUCCESS_RATE
  end

  def passed!
    update(passed: true) if test_passed?
  end

  def question_current
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  private

  def set_currect_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.current_question == nil
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def test_success_rate
    correct_questions.to_f / test.questions.count * 100
  end

end

# frozen_string_literal: true

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :name, :email, presence: true

  def passed_tests_by_level(level)
    Test.joins('JOIN passed_tests ON passed_tests.test_id = tests.id')
        .where(passed_tests: { user_id: id }, tests: { level: level })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
end

class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def passed_tests_by_level(level)
    Test.joins('JOIN user_tests ON user_tests.test_id = tests.id')
      .where(user_tests: { user_id: self.id }, tests: { level: level})
  end
end

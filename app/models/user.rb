class User < ApplicationRecord

  def tests_by_level(level)
    User_test.joins('JOIN user_tests ON tests.id = user_tests.tests_id')
      .where(user_tests: { level: level })
  end
end

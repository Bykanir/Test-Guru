class RuleAllLevelSpecification < AbstractRuleSpecification

  def satisfies?
    check_level(@option)
  end

  private

  def check_level(option)
    tests_level = Test.where(level: option)
    user_tests = Test.where(level: option)
                     .joins(:test_passages)
                     .where(test_passages: { user: @test_passage.user, passed: true})
                     .pluck(:id)
                     .uniq
    
    tests_level.count == user_tests.count
  end
end

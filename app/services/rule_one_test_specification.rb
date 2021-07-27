class RuleOneTestSpecification < AbstractRuleSpecification

  def satisfies?
    check_test(@test_passage)
  end

  private
  
  def check_test(test_passage)
    test_passage.test_passed?
  end
end

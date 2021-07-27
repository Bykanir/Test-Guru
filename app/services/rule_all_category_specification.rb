class RuleAllCategorySpecification < AbstractRuleSpecification

  def satisfies?
    check_category(@option)
  end

  private

  def check_category(option)
    tests_category = Test.where(category: option)
    user_tests = Test.joins(:category)
                     .where(category_id: option)
                     .joins(:test_passages)
                     .where(test_passages: { user: @test_passage.user, passed: true })
                     .pluck(:id)
                     .uniq

    tests_category.count == user_tests.count
  end
end

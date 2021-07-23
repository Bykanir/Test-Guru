class AwardBadgesService

  def self.call(test_passage)
    new(test_passage).reward!
  end

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = test_passage.test
  end
  
  def reward!
    check_test(@test_passage)
    check_category(@test.category.id)
    check_level(@test.level)
  end

  private

  def check_test(test_passage)
    award_test(test_passage.test.id) if test_passage.passed == true
  end

  def check_category(category)
    tests_category = Test.where(category: category)
    user_tests = Test.joins(:category)
                     .where(category_id: category)
                     .joins(:test_passages)
                     .where(test_passages: { user: @user, passed: true })
                     .pluck(:id)
                     .uniq

    award_category(category) if tests_category.count == user_tests.count
  end

  def check_level(level)
    tests_level = Test.where(level: level)
    user_tests = Test.where(level: level)
                     .joins(:test_passages)
                     .where(test_passages: { user: @user, passed: true})
                     .pluck(:id)
                     .uniq
    
    award_level(level) if tests_level.count == user_tests.count
  end

  def award_test(test)
    badge_id = Badge.where(test: test).pluck(:id).first
    create_badge(badge_id)
  end

  def award_category(category)
    badge_id = Badge.where(category: category).pluck(:id).first
    create_badge(badge_id)
  end

  def award_level(level)
    badge_id = Badge.where(level: level).pluck(:id).first
    create_badge(badge_id)
  end

  def create_badge(badge_id)
    BadgesUser.create(user_id: @user.id, badge_id: badge_id)
  end

end
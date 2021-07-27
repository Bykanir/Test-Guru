class AwardBadgesService

  RULES = {
    4 => RuleOneTestSpecification,
    5 => RuleAllCategorySpecification,
    6 => RuleAllLevelSpecification
  }.freeze 

  def self.call(test_passage)
    new(test_passage).reward 
  end

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = test_passage.test
  end
  
  def reward
    Badge.find_each do |badge|
      rule = RULES[badge.rule_id].new(option: badge.option, test_passage: @test_passage)
      award_badge(badge) if rule.satisfies?
    end
  end

  private

  def award_badge(badge)
    BadgesUser.create(user_id: @user.id, badge_id: badge.id)
  end
end

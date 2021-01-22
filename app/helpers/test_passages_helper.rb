module TestPassagesHelper
  
  def result_test
    @test_passage.success_rate ? test_passed : test_failed
  end

  private

  def test_passed
    { color: :result_green, text: 'You passed the test' }
  end

  def test_failed
    { color: :result_red, text: 'You failed the test' }
  end
end

module TestPassagesHelper
  
  def result_text
    @test_passage.test_passed? ? text[:passed] : text[:failed]
  end

  def result_color
    @test_passage.test_passed? ? :result_green : :result_red
  end

  private

  def text
    { passed: 'You passed the test', failed: 'You failed the test' }
  end

end

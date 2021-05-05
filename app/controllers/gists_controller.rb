class GistsController < ApplicationController

  before_action :set_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question)
    result.call
    if result.success?
      current_user.gists.create(question: @test_passage.current_question, url: result.url)
      redirect_to @test_passage, notice: t('.success', url: result.url)
    else
      redirect_to @test_passage, alert: t('.failure')
    end

  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
  
  def success?
    status = 200
    status.include?(self.client.last_response.status.to_i)
  end

  def url
    self.client.last_response.headers[:location]
  end

end

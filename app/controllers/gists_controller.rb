class GistsController < ApplicationController

  before_action :find_test_passage

  def create
    result = GistQuestionService.call(@test_passage.current_question)

    if result.success?
      current_user.gists.create(question: @test_passage.current_question, url: result.url, hash_id: result.id)
      redirect_to @test_passage, notice: t('test_passages.gist.success', url: result.url)
    else
      redirect_to @test_passage, alert: t('test_passages.gist.failure')
    end

  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
  
end

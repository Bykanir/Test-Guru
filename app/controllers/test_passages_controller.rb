class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      @test_passage.passed!
      call_badge if @test_passage.passed!
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else  
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def call_badge
    badge = AwardBadgesService.call(@test_passage)
    flash[:notice] = t('.new_badge')
  end

end

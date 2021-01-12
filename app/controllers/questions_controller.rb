class QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  def index
    @test.questions
  end

  def show

  end

  def destroy
    @question.destroy 
    redirect_to root_path
  end

  def new

  end
  
  def create
    Question.create(question_params)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
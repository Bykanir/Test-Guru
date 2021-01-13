class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create new]
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
    @question = Question.create(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end

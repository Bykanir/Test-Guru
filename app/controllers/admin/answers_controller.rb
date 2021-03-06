class Admin::AnswersController < Admin::BaseController

  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]
  
  def show; end

  def new
    @answer = Answer.new
  end

  def edit; end

  def create
    @answer = Answer.build(answer_params)

    if @answers.save
      redirect_to @answers, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:title, :correct)
  end
    
end

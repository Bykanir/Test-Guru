module QuestionsHelper

  def question_header
    if @question.persisted?
      "Edit <#{@question.test.title}> Question"
    else
      "Create new <#{@test.title}> Question"
    end
  end
end

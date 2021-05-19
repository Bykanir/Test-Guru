class GistQuestionService

  def self.call(question)
    new(question).call
  end

  def initialize(question)
    @question = question
    @test = @question.test
  end

  ResultObject = Struct.new(:id, :status, :url) do
    def success?
      status == 201
    end
    
  end

  def call
    response = octokit_client.create_gist(gist_params)
    ResultObject.new(response.id, @client.last_response.status, response.html_url)
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:title)].join("\n")
  end

  def octokit_client
    @client = Octokit::Client.new(access_token: ENV["ACCESS_TOKEN"])
  end

end

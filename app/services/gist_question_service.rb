class GistQuestionService

  def self.call(question)
    new(question).call
  end

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    octokit_create
  end

  ResultObject = Struct.new(:id, :status, :url) do
    def success?
      status == 201
    end
    
  end

  def call
    result = @client.create_gist(gist_params)
    ResultObject.new(result.id, @client.last_response.status, result.html_url)
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

  def octokit_create
    @client = @client_default || Octokit::Client.new(access_token: ENV["ACCESS_TOKEN"])
  end

end

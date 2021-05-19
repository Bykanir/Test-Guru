class GistQuestionService

  def self.call(object)
    new(object).call
  end

  attr_reader :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV["ACCESS_TOKEN"])
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

end

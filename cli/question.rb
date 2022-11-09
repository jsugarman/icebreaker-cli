require "net/http"
require "uri"
require "json"


module CLI
  class Question
    Result = Struct.new(:question, :answer)

    HOST = "https://opentdb.com/api.php?amount=1".freeze
    URI = URI.parse(HOST)

    def self.random
      response = Net::HTTP.get_response(URI)
      results = JSON.parse(response.body, symbolize_names: true)[:results]

      Result.new(results.first[:question],
                 results.first[:correct_answer])
    end
  end
end




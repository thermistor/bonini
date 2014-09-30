require 'faraday'

class PivotalAPI

  # curl -X GET -H "X-TrackerToken: $PIVOTAL_API_TOKEN" "https://www.pivotaltracker.com/services/v5/projects/165517/stories?filter=type%3Arelease"

  BASE_URL = 'https://www.pivotaltracker.com'

  def initialize(options = {})
    raise ArgumentError, ':api_token must be provided' unless options[:api_token]
    @conn = Faraday.new(url: BASE_URL, headers: {'X-TrackerToken' => options[:api_token]})
  end

  private

    attr_reader :conn

    def method_missing(name, *args, &block)
      conn.send(name, *args, &block)
    end

end

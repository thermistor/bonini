require 'json'
require 'mustache'
require 'pivotal_api'

class Roadmap < Mustache

  self.path = File.expand_path('../../templates', __FILE__)

  def initialize
    @pivotal_api = PivotalAPI.new(api_token: ENV['PIVOTAL_API_TOKEN'])
    @project_id = ENV['PIVOTAL_PROJECT_ID']
    @iteration_length = 1 # TODO: get from API via project attributes
  end

  # accepted this iteration
  def shipped
    get_stories_as_json "type:release accepted_after:#{start_of_iteration}"
  end

  def planned
    get_stories_as_json 'type:release state:unstarted'
  end

  def unscheduled
    get_stories_as_json 'type:release state:unscheduled'
  end

  private

    attr_reader :pivotal_api, :project_id, :iteration_length

    def get_stories_as_json(filter = '')
      res = pivotal_api.get(stories_api_path, filter: filter)
      JSON.parse(res.body)
    end

    def stories_api_path
      "/services/v5/projects/#{project_id}/stories"
    end

    def weeks_ago_in_seconds(weeks = 1)
      weeks * 7 * 24 * 3600
    end

    def start_of_iteration
      t = Time.now - weeks_ago_in_seconds(iteration_length)
      t.strftime('%m/%d/%Y')
    end

end

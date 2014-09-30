require 'mustache'

class Roadmap < Mustache

  self.path = File.expand_path('../../templates', __FILE__)

  # https://www.pivotaltracker.com/services/v5/projects/165517/stories?filter=type%3Arelease&with_state=
  # shipped = accepted this iteration
  # planned = delivered, finished, started, rejected, planned in backlog
  # uscheduled = unscheduled (ie. icebox)

  def shipped
    [
      { name: 'Release A', description: "This is description A #{ENV['PIVOTAL_API_TOKEN']}" }
    ]
  end

  def planned
    [
      { name: 'Release B', description: 'This is description B' },
      { name: 'Release C', description: 'This is description C' },
    ]
  end

  def unscheduled
    [
      { name: 'Release D', description: 'This is description D' },
      { name: 'Release E', description: 'This is description E' },
      { name: 'Release F', description: 'This is description F' }
    ]
  end

end

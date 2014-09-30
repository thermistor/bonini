$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'roadmap'
require 'yaml'

task :environment do
  env_file = File.expand_path('../config.yml', __FILE__)
  abort 'No config.yml file present!' unless File.exists?(env_file)
  YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
  end
end

task :generate_roadmap => :environment do
  puts Roadmap.render
end

task default: %w[generate_roadmap]

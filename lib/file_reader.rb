require 'json'
require_relative './helpers/logger'

class FileReader
  include Logging

  def self.read(path)
    parsed_data = []
    File.foreach(path) do |line|
      parsed_line = parse_json(line)
      parsed_data << parsed_line if parsed_line
    end
    parsed_data
  end

  def self.parse_json(json)
    JSON.parse(json)
  rescue JSON::ParserError
    logger.error("Could not parse line '#{json}'")
    return false
  end
end

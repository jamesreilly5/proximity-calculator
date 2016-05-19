require 'json'
require_relative './helpers/logger'

class FileReader
  include Logging

  def self.read(path)
    return [] unless valid_file?(path)
    parsed_data = []
    File.foreach(path) do |line|
      parsed_line = parse_json(line)
      parsed_data << parsed_line if parsed_line
    end
    parsed_data
  end

  def self.valid_file?(path)
    return true unless File.size?(path).nil?
    logger.error('File is empty or does not exist')
    false
  end

  def self.parse_json(json)
    JSON.parse(json)
  rescue JSON::ParserError
    logger.error("Could not parse line '#{json}'")
    return false
  end
end

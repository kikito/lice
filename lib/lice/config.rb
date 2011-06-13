require 'yaml'
require 'ostruct'

class Lice

  class Config < OpenStruct

    DEFAULT_PATH = File.join(Dir.pwd, 'config.yml')

    DEFAULTS = {
      :source => Dir.pwd,
      :destination => File.join(Dir.pwd, '_site')
    }

    def initialize(path = DEFAULT_PATH)
      begin
        data = YAML.load_file(path)
      rescue Exception => ex
        raise Lice::Error.new(ex.message)
      end
      raise Lice::Error.new("Invalid config file - #{@path}") unless data.is_a? Hash
      super(data.merge(DEFAULTS))
    end
  end
end

require "lice/error"
require "lice/config"

class Lice

  attr_accessor :config

  def initialize(config_path = Lice::Config::DEFAULT_PATH)
    @config = Lice::Config.new(config_path)
  end

end

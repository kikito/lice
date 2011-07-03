require 'lice/file'

class Lice

  DEFAULT_OUTPUT_FOLDER = 'output'
  DEFAULT_INPUT_FOLDER = '.'

  attr_writer :output_folder, :input_folder

  def version
    version_path = ::File.join(::File.dirname(__FILE__), '..', 'VERSION')
    version = ::File.open(version_path, &:readline)
  end

  def output_folder
    @output_folder ||= DEFAULT_OUTPUT_FOLDER
  end

  def input_folder
    @input_folder ||= DEFAULT_INPUT_FOLDER
  end

  def files
    list = Dir.new(input_folder).entries - ['.', '..']
    list.collect { |f| ::File.join(input_folder, f) }
  end

  def run
    files.each do |file_path|
      f = Lice::File.new(file_path, output_folder)
      f.process
    end
  end

end

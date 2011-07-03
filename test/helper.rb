require 'assertor'
require 'fileutils'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'lice'

class Assertor::Case

  def output_folder(*subdirs)
    File.join(File.dirname(__FILE__), 'output', *subdirs)
  end

  def input_folder(*subdirs)
    File.join(File.dirname(__FILE__), 'input', *subdirs)
  end

  def clear_output_folder
    FileUtils.rm_rf(output_folder)
    Dir.mkdir(output_folder)
  end

end

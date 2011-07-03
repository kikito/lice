require 'fileutils'

class Lice
  class File < ::File

    POST_EXTENSIONS = %w{html polo}
    POST_DATE_REGEXP = /(\d\d\d\d\-\d\d\-\d\d).*/

    attr_reader :output_folder

    def initialize(path, output_folder)
      super(path)
      @output_folder = output_folder
    end

    def is_post?
      (name =~ POST_DATE_REGEXP) && (POST_EXTENSIONS.include? extension)
    end

    def name
      @name ||= ::File.basename(self.path)
    end

    def extension
      @extension = ::File.extname(self.path)[1..-1] || ""
    end

    def is_directory?
      ::File.directory?(self.path)
    end

    def process
      if is_directory?
        FileUtils.rm_rf(output_path)
        Dir.mkdir(output_path)
      elsif is_post?
        FileUtils.cp(self.path, output_path)
      else
        FileUtils.cp(self.path, output_path)
      end
    end

    def output_path
      ::File.join(output_folder, name)
    end

    def output_file_exists?
      ::File.exists?(output_path)
    end

  end
end

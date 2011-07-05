require 'fileutils'
require 'iconv'

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

    def is_polo?
      extension == 'polo'
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
        process_post
      else
        FileUtils.cp(self.path, output_path)
      end
    end

    def day
      name[8..9]
    end
    
    def month
      name[5..6]
    end

    def year
      name[0..3]
    end

    def slug
      slugify(remove_polo(remove_html(name[11..-1])))
    end

    def output_path
      if is_post?
        ::File.join(post_output_folder,  'index.html')
      else
        ::File.join(output_folder, name)
      end
    end

    def output_file_exists?
      ::File.exists?(output_path)
    end

    private

    def post_output_folder
      ::File.join(output_folder, year, month, day, slug)
    end
    
    def process_post
      FileUtils.mkdir_p(post_output_folder)
      FileUtils.cp(self.path, output_path)
    end

    def slugify(text)
      text.downcase!
      text = Iconv.conv('ASCII//TRANSLIT//IGNORE', 'UTF8', text)
      text.gsub! /\s+/, '-'        # spaces
      text.gsub! /_+/, '-'         # underscores
      text.gsub! /[^a-z0-9-]+/, '' # non-alpha
      text.chomp '-'               # trailing hyphens
    end

    def remove_html(str)
      str[/(.+)\.html$/, 1] || str
    end

    def remove_polo(str)
      str[/(.+)\.polo$/, 1] || str
    end

  end
end

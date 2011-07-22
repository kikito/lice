require 'helper'
module Test

  module Lice

    class Test::Lice::Lice < Assertor::Case
      def test_default_output_folder_is_output()
        assert_equals(::Lice.new.output_folder, 'output')
      end

      def test_output_folder_can_be_changed()
        lice = ::Lice.new
        lice.output_folder = 'foo'
        assert_equals(lice.output_folder, 'foo')
      end

      def test_default_output_folder_is_dot()
        assert_equals(::Lice.new.input_folder, '.')
      end

      def test_input_folder_can_be_changed()
        lice = ::Lice.new
        lice.input_folder = 'bar'
        assert_equals(lice.input_folder, 'bar')
      end

      def test_version_is_read_from_file()
        version_path = File.join(File.dirname(__FILE__), '..', '..', 'VERSION')
        version = File.open(version_path, &:readline)
        assert_equals(::Lice.new.version, version)
      end

      def test_get_files_returns_all_files_in_the_input_folder()
        files = Dir.new(input_folder).entries - ['.', '..']
        files = files.collect{ |f| ::File.join(input_folder, f) }
        lice = ::Lice.new
        lice.input_folder = input_folder
        assert_equals(lice.files, files)
      end

      def test_run_should_process_the_input_files()
        clear_output_folder
        lice = ::Lice.new
        lice.input_folder = input_folder
        lice.output_folder = output_folder
        lice.run
        # output_files = Dir.new(output_folder).entries - ['.', '..']
        lice.files.each do |file_path|
          file = ::Lice::File.new(file_path, input_folder, output_folder)
          assert(file.output_file_exists?)
        end
      end

    end

  end
end

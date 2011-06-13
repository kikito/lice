require 'helper'
module Test

  module Lice

    class Test::Lice::Config < Assertor::Case
      def test_no_file_should_raise_error
        default_path = File.join(Dir.pwd, 'config.yml')
        assert_raises(::Lice::Error, "No such file or directory - #{default_path}") do
          ::Lice.new()
        end
      end

      def test_erroneous_file_should_raise_error
        erroneous_path = File.join(Dir.pwd, 'test', 'files', 'array_config.yml')
        assert_raises(::Lice::Error, "Invalid config file - #{@path}") do
          ::Lice.new(erroneous_path)
        end
      end

      def test_should_have_default_values
        empty_path = File.join(Dir.pwd, 'test', 'files', 'empty_config.yml')
        lice = ::Lice.new(empty_path)
        assert_equals(Dir.pwd, lice.config.source)
        assert_equals(File.join(Dir.pwd, '_site'), lice.config.destination)
      end

    end

  end
end

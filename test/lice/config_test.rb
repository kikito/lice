require 'helper'
module Test

  module Lice

    class Test::Lice::Config < Assertor::Case
      def initialize()
        @path = File.join(Dir.pwd, 'config.yml')
      end

      def test_no_file_should_thow_error
        assert_raises(::Lice::Error, "config file not found in #{@path}") do
          ::Lice.new()
        end
      end

    end

  end
end

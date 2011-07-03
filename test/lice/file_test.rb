module Test
  module Lice
    class FileTest < Assertor::Case
      def test_file_starting_with_yyyy_mm_dd_is_a_post
        f = open_file '2011-01-01-foo.html'
        assert f.is_post?
      end

      def test_file_not_starting_with_yyyy_mm_dd_is_not_a_post
        f = open_file 'style.css'
        assert_not f.is_post?
      end

      def test_file_not_ending_in_html_or_polo_is_not_a_post
        f = open_file '2011-01-02-bar.txt'
        assert_not f.is_post?
      end

      private

      def open_file(name)
        ::Lice::File.new(input_folder(name), output_folder)
      end
    end
  end
end

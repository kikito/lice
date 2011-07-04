module Test
  module Lice
    class FileTest < Assertor::Case
      def test_file_starting_with_yyyy_mm_dd_is_a_post
        f = open_file '2011-01-02-a-title.html'
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

      def test_day_of_a_post_returns_the_day
        f = open_file '2011-01-02-a-title.html'
        assert_equals '02', f.day
      end

      def test_month_of_a_post_returns_the_month
        f = open_file '2011-01-02-a-title.html'
        assert_equals '01', f.month
      end

      def test_year_of_a_post_returns_the_year
        f = open_file '2011-01-02-a-title.html'
        assert_equals '2011', f.year
      end

      def test_slug_of_a_post_returns_the_slug
        f = open_file '2011-01-02-a-title.html'
        assert_equals 'a-title', f.slug
      end

      def test_post_files_are_translated_into_a_folder_structure_ending_on_an_index_html
        f = open_file '2011-01-02-a-title.html'
        assert_equals f.output_path, ::File.join(output_folder, '2011', '01', '02', 'a-title', 'index.html')
      end

      private

      def open_file(name)
        ::Lice::File.new(input_folder(name), output_folder)
      end
    end
  end
end

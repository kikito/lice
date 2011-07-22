# coding: utf-8

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

      def test_slug_eliminates_spaces_underscores_and_non_ascii
        f = open_file '2011-01-03 ¡Qué curiosos, los niños!.html'
        assert_equals 'que-curiosos-los-ninos', f.slug
      end

      def test_post_files_are_translated_into_a_folder_structure_ending_on_an_index_html
        f = open_file '2011-01-02-a-title.html'
        assert_equals f.output_path, output_folder('2011', '01', '02', 'a-title', 'index.html')
      end

      def test_polo_posts_have_their_polo_bit_removed
        f = open_file '2011-01-04-a-polo-post.polo'
        assert_equals 'a-polo-post', f.slug
        assert_equals f.output_path, output_folder('2011', '01', '04', 'a-polo-post', 'index.html')
      end

      def test_is_polo_returns_true_in_polo_posts
        f = open_file '2011-01-04-a-polo-post.polo'
        assert f.is_polo?
      end

      def test_regular_file_inside_a_folder_gets_copied_to_output_with_its_path
        f = open_file 'subdir', 'hello.txt'
        assert_equals f.output_path, output_folder('subdir', 'hello.txt')
      end

      def test_post_file_inside_a_folder_gets_copied_to_output_with_its_path
        f = open_file 'subdir', '2011-01-05-a-title.html'
        assert_equals f.output_path, output_folder('subdir', '2011', '01', '05', 'a-title', 'index.html')
      end

      def test_polo_post_inside_a_folder_gets_copied_to_output_with_its_path
        f = open_file 'subdir', '2011-01-06-a-polo-post.html'
        assert_equals f.output_path, output_folder('subdir', '2011', '01', '06', 'a-polo-post', 'index.html')
      end

      private

      def open_file(*subdirs)
        ::Lice::File.new(input_folder(*subdirs), input_folder, output_folder)
      end
    end
  end
end

lice
=========

A microscopic blogging tool.

It takes a source directory and generates a new directory (the "output folder"). Inside this destination directory there is usually a
bunch of html files.

By default, lice will:

- consider any file whose name begins with a valid date in the form yyyy-mm-dd as a post. By default, posts are generated inside a folder called yyyy/mm/dd/title-of-the-post.
- translate any file ending in .polo (including posts) to html using loincloth.
- copy the rest of the files and folders to the destination folder (by default called _site)
- the following files will be ignored
  - any .svn folders
  - .gitignore
  - .git
  - config.rb

Lice will start loading config.rb, if it finds one. You can use config.rb to monkeypatch lice in any way you want.


Usage
-----

With a folder structure like this one:

```
my_blog/
  |
  +-- 2011-01-01 My first post.polo
  |
  +-- 2011-01-02 My second post.html
  |
  +-- 2011-02-03-my-third-post-was-sluggized.polo
  |
  `-- 2011-02-04_my_last_post_is_underscored.html

```

When you execute the following command:

```
cd my_blog
lice
```

You will get the following inside my_blog/_site:

```
my_blog/
  |
  +-- _site
  |    |
  |    +-- index.html
  |    |
  |   2011
  |    |
  |    +-- 01
  |    |    |
  |    |    +-- 01
  |    |    |    |
  |    |    |    +-- my-first-post
  |    |    |         |
  |    |    |       index.html
  |    |    +-- 02
  |    |         |
  |    |         +-- my-second-post
  |    |              |
  |    |            index.html
  |    +-- 02
  |         |
  |         +-- 03
  |         |    |
  |         |    +-- my-third-post-was-sluggized
  |         |         |
  |         |       index.html
  |         +-- 04
  |              |
  |              +-- my-last-post-was-underscored
  |                  |
  |                index.html
  |
  +-- 2011-01-01 My first post.polo
  |
  +-- 2011-01-02 My second post.html
  |
  +-- 2011-02-03-my-third-post-was-sluggized.polo
  |
  `-- 2011-02-04_my_last_post_is_underscored.html

```

Post titles will be deduced from their file name, and will be de-underscored, de-sluggized and (by default) put on their file.

The generated blog will be a very spartan, html-only-with-no-styles blog.

If you want to add CSS, you will probably have to include a config.rb file.

config.rb
---------

You can change pretty much anything in config.rb. Here're some examples:

- You can add a new file on the list of ignored files by making. For example, if you want to ignore the "private" folder, inside root:

    Lice.ignored_files << 'private'

  Both strings and regular expressions are accepted. Strings are considered local paths, unless they begin with "/".

- You can change the output folder

    Lice.output_folder = "/a/different/output/folder/on/my/computer"

- include css

    Lice.templates.header << '<LINK href="/css/style.css" rel="stylesheet" type="text/css">'

  Files and folders are just copied over to the output folder, so if you include a css/style.css stylesheet, it will be used in your site.

- You can include javascript

    Lice.templates.footer << '<script type="text/javascript" src="demo_time.js"></script>'

Keep in mind these are just some basic examples. You can change pretty much anything you want inside config.rb.


Contributing to lice
-------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Enrique García Cota. See LICENSE.txt for
further details.


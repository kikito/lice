lice
=========

A microscopic blogging tool.

It takes a source directory and generates a new directory, called
"destination". Inside this destination directory there is usually a
bunch of html files, plus css and/or javascript.

lice makes use of loincloth to translate .polo files into html.

Special files/dirs:

* config.yml will have several blog-related information (such as the
  destination dir, or the author name).
* templates/default.html will be used for the general page layout. It should
  contain at least one erb section with a yield call.
* templates/index.html will be used for the main page. It will contain a list of
  articles. Usually it must contain a loop that parses all articles and
prints a link to each one.
* templates/article.html will be used on each article view.
* about.html/about.polo will be text-free.
* [anything else] any other file inside pages will be translated
  just like about.html 
* articles/ will contain a bunch of files. Each of those files must be
  named this way: yyyy-mm-dd-title-of-posts.[html|polo] . These files
will be the posts
* [any other filetype or directory] will just be copied to the
  destination folder.

Usage
-----

With a folder structure like this one:

```
my_blog/
  |
  +--config.yml
  |
  +--about.polo
  |
  +--templates/
  |     |
  |     +--index.html
  |     |
  |     +--article.html
  |     |
  |     +--default.html
  |
  +--articles/
        |
        +--1900-01-01-the-beginning-of-the-century.polo
        |
        +--2000-01-01-the-2000-effect.polo
        |
       ...
```

When you execute the following command:

```
cd my_blog
lice .
```

A new folder called _site will be created. This site will contain the
blog pages.

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


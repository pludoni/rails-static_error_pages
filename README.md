# StaticErrorPages

[![Gem Version](https://badge.fury.io/rb/static_error_pages.svg)](https://badge.fury.io/rb/static_error_pages)

Quick'n Dirty static error pages generator for Rails

- Relies on ``ApplicationController.renderer`` to generate 404.html, 500.html, 503.html, 422.html during deploy
- Adds a rake task ``bundle exec rails assets:error_pages`` and adds that to ``precompile`` for auto deployment.

This is a Rails Engine, and it provides some German language SLIM templates which should be copied over:

```
bundle exec rails g static_error_pages:copy
```

Afterwards, adjust the files in ``app/views/error_pages/*``, especially the layout file and include a minimalistic CSS for the error page.

## Developing error pages

Currently, run the rake task after every change: ``rails assets:error_pages`` and it will generate all files into public/*

## Config

Rails initializer / application.rb / environments:

```ruby
## add oder change list of files
Rails.application.config.static_error_pages.pages = ["404.html", "500.html", "503.html", "422.html"]


## default layout file = error_pages/layout
Rails.application.config.static_error_pages = "../error_pages/layout"
```

## Webpacker

If you naively link the javascript/stylesheet pack tag, they might end of empty. Depending on your setup, you can try:

- 1. activate ``  extract_css: true`` in ``config/webpacker.yml``
- 2. use the ``inline_pack_tag`` helper function to fully inline css/js webpack packs

# jekyll-migrate-permalink

`jekyll-migrate-permalink` is a plugin that aims to make your life easier if you're considering changing your [permalink](https://jekyllrb.com/docs/permalinks/). I got the idea for this plugin as I was considering a switch from `/blog/:title` to `/title`.

A change to your permalink means that any backlinks to your site will break. You have a few options...

- Redirect all old URLs to the new permalinks.
- Continue serving old content at your old URL and only use the new permalink style for new content

`jekyll-migrate-permalink` can help you with either approach.

## Installation

This plugin is available as a [RubyGem](https://rubygems.org/gems/jekyll-migrate-permalink)

Add this line to your `Gemfile`:

```ruby
group :jekyll_plugins do
  gem 'jekyll-migrate-permalink'
end
```

Then execute the `bundle` command to install the gem.

## Usage

### Redirect all old URLs to the new permalink

The [`jekyll-redirect-from`](https://github.com/jekyll/jekyll-redirect-from) plugin is [available on GitHub pages](https://pages.github.com/versions/) can be used to for creating redirects. However, to do this you need to update your front matter with a `redirect_from` specifying the old URL. `jekyll-migrate-permalink` makes this process painless.

1. Before changing your permalink style in `_config.yml` run `jekyll migrate-permalink`. The front matter will be updated on all your posts with a `redirect_from` referencing your post's current URL.
2. Update your permalink in `_config.yml`
3. Build your site!

### Continue serving old content at old URLs

`jekyll-migrate-plugin` can also help with this approach. Again, it's painless

1. Before changing your permalink style in `_config.yml` run `jekyll migrate-permalink --strategy retain`. The front matter will be updated on all your posts with a `permalink` referencing your current post's URL.
2. Update your permalink in `_config.yml`
3. Build your site!

## Caveats

Note that the plugin loads the front matter as YAML in order to safely manipulate, and then converts it back to a string. This process may result in some slight formatting changes to your front matter.

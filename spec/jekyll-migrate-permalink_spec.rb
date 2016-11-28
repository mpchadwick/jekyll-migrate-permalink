require 'spec_helper'

describe(Jekyll::Migrate::Permalink) do
  it "adds a redirect to the front matter" do
    content = source_dir("no-redirects-no-permalink.md")
    url = "example.com/no-redirects-no-permalink"
    output = Jekyll::Commands::MigratePermalinks.process_content(content, url, "redirect")

    output =~ Jekyll::Document::YAML_FRONT_MATTER_REGEXP
    frontmatter = SafeYAML.load(Regexp.last_match(1))
    expect(frontmatter["redirect_from"]).to eql([url])
  end
end

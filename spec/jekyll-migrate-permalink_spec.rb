require 'spec_helper'

describe(Jekyll::Migrate::Permalink) do
  it "adds a redirect to the front matter" do
    content = File.read(source_dir("no-redirects-no-permalink.md"))
    url = "/no-redirects-no-permalink"
    output = Jekyll::Commands::MigratePermalinks.process_content(content, url, "redirect")

    output =~ Jekyll::Document::YAML_FRONT_MATTER_REGEXP
    frontmatter = SafeYAML.load(Regexp.last_match(1))
    expect(frontmatter["redirect_from"]).to eql([url])
  end

  it "appends a redirect to the front matter if it already has one in list format" do
    content = File.read(source_dir("one-redirect-in-list-format-no-permalink.md"))
    url = "/one-redirect-in-list-format-no-permalink"
    output = Jekyll::Commands::MigratePermalinks.process_content(content, url, "redirect")

    output =~ Jekyll::Document::YAML_FRONT_MATTER_REGEXP
    frontmatter = SafeYAML.load(Regexp.last_match(1))
    expect(frontmatter["redirect_from"]).to eql(["/current-redirect", url])
  end

  it "appends a redirect to the front matter if it already has one as a scalar" do
    content = File.read(source_dir("one-redirect-in-scalar-format-no-permalink.md"))
    url = "/one-redirect-in-scalar-format-no-permalink"
    output = Jekyll::Commands::MigratePermalinks.process_content(content, url, "redirect")

    output =~ Jekyll::Document::YAML_FRONT_MATTER_REGEXP
    frontmatter = SafeYAML.load(Regexp.last_match(1))
    expect(frontmatter["redirect_from"]).to eql(["/current-redirect", url])
  end
end

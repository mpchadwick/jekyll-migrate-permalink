module Jekyll
  module Commands
    class MigratePermalinks < Command
      class << self
        def init_with_program(prog)
          prog.command(:"migrate-permalink") do |c|
            c.description "Migrate your permalinks"
            c.option "strategy", "-s", "--strategy STRATEGY", "Strategy"

            add_build_options(c)

            c.action do |args, opts|
              opts["serving"] = false
              Jekyll::Commands::MigratePermalinks.process(args, opts)
            end
          end
        end

        def process(args, opts)
          Jekyll.logger.adjust_verbosity(opts)
          options = configuration_from_options(opts)
          site = Jekyll::Site.new(options)

          site.reset
          site.read

          site.posts.docs.each do |post|
            content = File.read(post.path, Utils.merged_file_read_opts(site, options))
            if content =~ Document::YAML_FRONT_MATTER_REGEXP
              content = $POSTMATCH
              frontmatter = SafeYAML.load(Regexp.last_match(1))
            end

            if opts["strategy"] == "retain"
              frontmatter["permalink"] = post.url
            else
              if frontmatter["redirect_from"].is_a? Array
                frontmatter["redirect_from"].push(post.url)
              else
                frontmatter["redirect_from"] = [post.url]
              end
            end

            output = "#{frontmatter.to_yaml}---\n\n#{content}"
            File.write(post.path, output, :mode => "w")

          end

        end

      end
    end
  end
end

require 'rubygems'
require 'algoliasearch'

module Jekyll
  module Commands
    class IndiaSearch < Command
      class << self
        def init_with_program(prog)
          prog.command(:indiasearch) do |c|
            c.action do |args, options|
              Jekyll.logger.info "Hello!"

              jekyll_options = configuration_from_options(options)
              algolia_config = jekyll_options['algolia']

              app_id = algolia_config['application_id']
              index_name = algolia_config['index_name']

              # Jekyll.logger.info app_id
              # Jekyll.logger.info index_name
              
              Algolia.init :application_id => "7UNKAH6RMH", :api_key => ENV['ALGOLIA_API_KEY']
              def load_data_from_database
                records = [{"name" => "test"}]
                # [...]
                return records
              end

              index = Algolia::Index.new("YourIndexName")
              # `load_data_from_database` must return an array of Hash representing your objects
              # load_data_from_database.each_slice(1000) do |batch|
              #   index.add_objects(batch)
              # end

              batch = JSON.parse(File.read("posts.json"))
              index.add_objects(batch)

            end
          end
        end

      end
    end
  end
end
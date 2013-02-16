module MainsmsApi
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_config_file
        copy_file 'mainsms.yml', 'config/mainsms.yml'
        copy_file 'mainsms_api.rb', 'config/initializers/mainsms_api.rb'
      end
    end
  end
end

require 'hashie'

module MainsmsApi
  class Configuration

    def self.api_key
      @settings.api_key
    end

    def self.read_settings
      @settings ||= Hashie::Mash.new(YAML.load_file(Rails.root.join('config', 'mainsms.yml'))).mainsms
    end
  end
end


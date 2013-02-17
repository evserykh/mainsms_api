require 'hashie'

module MainsmsApi
  class Configuration

    def self.api_key
      @settings.api_key
    end

    def self.project
      @settings.project
    end

    def self.setup(options)
      @settings ||= Hashie::Mash.new(options)
    end
  end
end


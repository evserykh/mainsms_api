require 'signed_parameters'

module MainsmsApi
  module Common
    def response
      @response ||= Hashie::Mash.new(JSON.parse(response_body))
    end

    private

    def project
      MainsmsApi::Configuration.project
    end

    def api_key
      MainsmsApi::Configuration.api_key
    end

    def query
      SignedParameters.to_query(params, api_key)
    end

    def protocol
      'http'
    end

    def host
      'mainsms.ru'
    end

    def url
      "#{protocol}://#{host}/#{path}?#{query}"
    end

    def request
      @request ||= HTTParty.get(url)
    end

    def response_body
      @response_body ||= request.body
    end
  end
end

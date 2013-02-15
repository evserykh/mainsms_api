module MainsmsApi
  module Common
    def response
      @response ||= Hashie::Mash.new(JSON.parse(response_body))
    end

    private

    def api_key
    end

    def used_params
      params.select { |k, v| v.present? }
    end

    def sorted_params
      used_params.values.map(&:to_s).sort
    end

    def sign
      sha1 = Digest::SHA1.hexdigest((sorted_params + [api_key]).join(';'))

      md5 = Digest::MD5.hexdigest(sha1)
    end

    def query
      used_params.merge(sign: sign).to_query
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

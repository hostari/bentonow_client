module Bentonow
  class Client
    BASE_URI = "app.bentonow.com"

    def initialize(@publishable_key, @secret_key)
    end

    def reset_client
      HTTP::Client.new(BASE_URI, port: 443, tls: true).tap do |client|
        client.before_request do |request|
          request.headers["Authorization"] = build_auth_header_value
          request.headers["Content-Type"] = content_type
        end
      end
    end

    private def build_auth_header_value
      "Basic #{Base64.urlsafe_encode(authorization_key)}"
    end

    private def authorization_key
      "#{@publishable_key}:#{@secret_key}"
    end

    private def content_type
      "application/json"
    end
  end
end

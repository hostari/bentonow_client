module Bentonow
  class Client
    private getter publishable_key : String
    private getter secret_key : String

    BASE_URI = "app.bentonow.com"

    def initialize(@publishable_key, @secret_key)
    end

    def reset_client
      HTTP::Client.new(BASE_URI, port: 443, tls: true).tap do |client|
        client.before_request do |request|
          request.headers["Authorization"] = "Basic #{Base64.urlsafe_encode("#{publishable_key}:#{secret_key}")}"
          request.headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end

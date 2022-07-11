# This endpoint is used to perform single updates on visitor data (https://docs.bentonow.com/api-v1/commands)

module Bentonow
  class Event
    def self.run_command(publishable_key : String, secret_key : String, site_uuid : String, body : String)
      client = Bentonow::Client.new(publishable_key, secret_key).reset_client
      client.post("/api/v1/fetch/commands?site_uuid=#{site_uuid}", body: body)
    end
  end
end

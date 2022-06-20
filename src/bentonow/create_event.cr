# This endpoint is used for single or batch processing of events such as adding tags or fields to one or more users (https://docs.bentonow.com/batch-api/events)

module Bentonow
  class Event
    def self.create_event(publishable_key : String, secret_key : String, site_uuid : String, body : String)
      client = Bentonow::Client.new(publishable_key, secret_key).reset_client
      client.post("/api/v1/batch/events?site_uuid=#{site_uuid}", body: body)
    end
  end
end

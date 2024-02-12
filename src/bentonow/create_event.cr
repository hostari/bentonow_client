module Bentonow
  class Event
    # Use this for single or batch processing of events such as adding tags or fields to one or more users. See Bento API reference [here](https://docs.bentonow.com/batch-api/event).
    def self.create_event(publishable_key : String, secret_key : String, site_uuid : String, body : String)
      client = Bentonow::Client.new(publishable_key, secret_key).reset_client
      client.post("/api/v1/batch/events?site_uuid=#{site_uuid}", body: body)
    end
  end
end

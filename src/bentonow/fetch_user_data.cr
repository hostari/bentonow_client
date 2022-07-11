# Returns a list of tags for each user account.

module Bentonow
  class Subscriber
    def self.fetch_user_data(publishable_key : String, secret_key : String, site_uuid : String, body : String)
      client = Bentonow::Client.new(publishable_key, secret_key).reset_client
      response = client.get("/api/v1/fetch/subscribers?site_uuid=#{site_uuid}", body: body)

      if response.status_code == 200
        JSON.parse(response.body)
      else
        raise Error.new(response.status_code.to_s)
      end
    end
  end
end

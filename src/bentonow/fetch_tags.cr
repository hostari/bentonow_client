# Returns a list of tags for each user account.

module Bentonow
  class Tag
    def self.fetch_tags(publishable_key : String, secret_key : String, site_uuid : String)
      client = Bentonow::Client.new(publishable_key, secret_key).reset_client
      response = client.get("/api/v1/fetch/tags?site_uuid=#{site_uuid}")

      if response.status_code == 200
        Hash(String, Array(Tag)).from_json(response.body)
      else
        raise Error.new(response.status_code.to_s)
      end
    end
  end
end

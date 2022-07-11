module Bentonow
  class SubscriberAttributes
    include JSON::Serializable

    @[JSON::Field(key: "uuid")]
    property uuid : String

    @[JSON::Field(key: "email")]
    property email : String

    @[JSON::Field(key: "fields")]
    property fields : Hash(String, String)?

    @[JSON::Field(key: "cached_tag_ids")]
    property cached_tag_ids : Array(String)?

    @[JSON::Field(key: "unsubscribed_at")]
    property unsubscribed_at : Time?

    @[JSON::Field(key: "navigation_url")]
    property navigation_url : String
  end

  class Subscriber
    include JSON::Serializable
    getter id : String
    getter type : String
    getter attributes : SubscriberAttributes
  end
end

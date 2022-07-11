module Bentonow
  class Attributes
    include JSON::Serializable

    @[JSON::Field(key: "name")]
    property name : String

    @[JSON::Field(created_at: "created_at")]
    property created_at : String

    @[JSON::Field(created_at: "discarded_at")]
    property discarded_at : String?

    @[JSON::Field(key: "site_id")]
    property site_id : Int64
  end

  class Tag
    include JSON::Serializable
    getter id : String
    getter type : String
    getter attributes : Attributes
  end
end

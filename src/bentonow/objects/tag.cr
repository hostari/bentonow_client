module Bentonow
  class TagAttributes
    include JSON::Serializable

    @[JSON::Field(key: "name")]
    property name : String

    @[JSON::Field(key: "created_at")]
    property created_at : String

    @[JSON::Field(key: "discarded_at")]
    property discarded_at : String

    @[JSON::Field(key: "site_id")]
    property site_id : Int64
  end

  class Tag
    include JSON::Serializable
    getter id : String
    getter type : String
    getter attributes : TagAttributes
  end
end

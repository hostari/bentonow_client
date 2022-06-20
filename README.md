# bentonow_client

This is a crystal wrapper for the Bentonow API. 

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     bentonow_client:
       github: hostari/bentonow_client
   ```

2. Run `shards install`

## Usage

Set the following api keys in `.env`: `publishable_key`, `secret_key`, `site_uuid`.

```crystal
require "bentonow_client"
```

To build a new Bentonow client:
```crystal
client = Bentonow::Client.new(publishable_key, secret_key)
```

To build a new Bentonow client:
```crystal
client = Bentonow::Client.new(publishable_key, secret_key)
```

## Endpoints
Most useful available Bentonow API resources are implemented.

1. Creating an Event - for single or batch processing of events such as adding users and other user information, adding tags to already exisiting users, or adding fields to existing users.

```crystal
event = Bentonow::Event.create_event(publishable_key, secret_key, site_uuid, body)
```

## Contributing

1. Fork it (<https://github.com/your-github-user/bentonow_client/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [paula4230](https://github.com/your-github-user) - creator and maintainer

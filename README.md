# bentonow_client

A crystal lang wrapper for the [Bentonow API](https://bentonow.com/).

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
publishable_key = ENV["BENTO_PUBLISHABLE_KEY"]
secret_key = ENV["BENTO_SECRET_KEY"]
client = Bentonow::Client.new(publishable_key, secret_key)
```

## Endpoints
Most useful available Bentonow API resources are implemented.

1. [Creating an Event](https://docs.bentonow.com/reference-api/create-events) - for single or batch processing of events such as adding users and other user information, adding tags to already exisiting users, or adding fields to existing users.

```crystal
body = {
  events: [
    {
      type: "$completed_onboarding",
      email: "test@test.com"
    },
    {
      type: "$completed_onboarding",
      email: "test@test.com",
      fields: {
        first_name: "Jesse",
        last_name: "Pinkman"
      }
    },
    {
      email: "test@test.com",
      type: "$purchase",
      fields: {
        first_name: "Jesse"
      },
      details: {
        unique: {
          key: "test123"
        },
        value: {
          currency: "USD",
          amount: 8000
        },
        cart: {
          items: [
            {
              product_sku: "SKU123",
              product_name: "Test",
              quantity: 100
            }
          ],
          abandoned_checkout_url: "https://test.com"
        }
      }
    }
  ]
}.to_json
site_uuid = ENV["BENTO_SITE_UUID"]
event = Bentonow::Event.create_event(publishable_key, secret_key, site_uuid, body)
```

## Contributing

1. Fork it (<https://github.com/your-github-user/bentonow_client/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Pauline De Polonia](https://github.com/paula4230) - creator
- [Xavi Ablaza](https://github.com/xaviablaza) - maintainer

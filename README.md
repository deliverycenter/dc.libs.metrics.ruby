# Dc::Metrics | dc.libs.metrics.ruby

Ruby implementation for DeliveryCenter's structured logging format.

> This package is part of a family of libraries that implement DeliveryCenter's metrics pattern  for different languages.
Check also our [Elixir](https://github.com/deliverycenter/dc.libs.metrics.elixir),
> [Golang](https://github.com/deliverycenter/dc.libs.metrics.golang) and
>[Node](https://github.com/deliverycenter/dc.libs.metrics.node) versions.

By default, all events will be logged to:

- Stdout, as a [Google Cloud Platform structured log](https://cloud.google.com/logging/docs/structured-logging)
- Metrics API, using PubSub

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dc-metrics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dc-metrics

## Usage

How to configure:
```ruby
Dc::Metrics.configure do |config|
  config.caller            = 'application_name'
  config.environment       = 'test'
  config.gcp_project_id    = 'project_id'
  config.pubsub_topic_name = 'topic_name'
  # Path to you local GCP credentials file if needed(mostly for local testing).
  config.gcp_credentials_path = 'path/to/file'
end
```

Obs: If there are missing parameters in this configuration the lib will fail to execute and output message to stdout! No exception is raised.

## Documentation

For this call of the library

```ruby
Dc::Metrics.debug("Message test!", {
  action: "CREATE_PRODUCT",
  direction: "INCOMING",
  source_type: "PROVIDER",
  source_name: "MY_PROVIDER",
  root_resource_type: "PRODUCT",
  ext_root_resource_id: "EXT1234",
  int_root_resource_id: "6789",
  int_store_id: 100
})
```

The stdout ouput will be:

```json
{
    "message": "Message test!",
    "modelLog": {
        "level": "DEBUG",
        "message": "Message test!",
        "caller": "application_name",
        "environment": "test",
        "correlation_id": "PROVIDER-MY_PROVIDER-EXT1234-6789",
        "create_timestamp": 1605714894275120000,
        "action": "CREATE_PRODUCT",
        "direction": "INCOMING",
        "source_type": "PROVIDER",
        "source_name": "MY_PROVIDER",
        "duration_ms": null,
        "root_resource_type": "PRODUCT",
        "ext_root_resource_id": "EXT1234",
        "int_root_resource_id": "6789",
        "child_resource_type": null,
        "child_resource_id": "",
        "ext_store_id": "",
        "int_store_id": "100",
        "error_code": null,
        "payload": null
    },
    "severity": "DEBUG"
}
```

To generate RDOC use
```bash
$ rdoc 'dc-metrics'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

**TODO:** To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Disable logs
If you need to disable the package behavior (for testing, for example), you can use:
```ruby
Dc::Metrics.disable
```


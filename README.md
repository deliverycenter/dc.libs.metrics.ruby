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

**TODO:** Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.


**TODO:** To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Documentation

To generate RDOC use
```ruby
rdoc 'dc-metrics'
```

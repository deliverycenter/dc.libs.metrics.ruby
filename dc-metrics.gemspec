# frozen_string_literal: true

require_relative 'lib/dc/metrics/version'

Gem::Specification.new do |spec|
  spec.name          = 'dc-metrics'
  spec.version       = Dc::Metrics::VERSION
  spec.authors       = ['Lucas Braz', 'Thiago May']
  spec.email         = ['dev.ti@deliverycenter.com']

  spec.summary       = "Ruby implementation for DeliveryCenter's structured logging format."
  spec.description   = "Ruby implementation for DeliveryCenter's structured logging format."
  spec.homepage      = 'https://github.com/deliverycenter/dc.libs.metrics.ruby'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # If hidden files are needed change it to Dir.glob("lib/**/*", File::FNM_DOTMATCH).
  spec.files         = Dir['lib/**/*']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  # Add "CHANGELOG.md" to this list after it is added to the project
  spec.extra_rdoc_files = Dir['README.md', 'LICENSE.txt']
  spec.rdoc_options += [
    '--title', 'Dc Metrics - ruby implementation',
    '--main', 'README.md',
    '--line-numbers',
    '--inline-source',
    '--quiet'
  ]
  # TODO: define lowest version of ruby
  # spec.required_ruby_version = ">= 2.5.0"

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_runtime_dependency 'google-protobuf', ' ~> 3.0'
  spec.add_runtime_dependency 'google-cloud-pubsub'
end

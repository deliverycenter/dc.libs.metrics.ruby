
require_relative "lib/dc/metrics/version"

Gem::Specification.new do |spec|
  spec.name          = "dc-metrics"
  spec.version       = Dc::Metrics::VERSION
  spec.authors       = ["Lucas Braz"]
  spec.email         = ["dev.ti@deliverycenter.com"]

  spec.summary       = %q{Ruby implementation for DeliveryCenter's structured logging format.}
  spec.description   = %q{Ruby implementation for DeliveryCenter's structured logging format.}
  spec.homepage      = "https://github.com/deliverycenter/dc.libs.metrics.ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/deliverycenter/dc.libs.metrics.ruby"
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # If hidden files are needed change it to Dir.glob("lib/**/*", File::FNM_DOTMATCH).
  spec.files         = Dir["lib/**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  # Add "CHANGELOG.md" to this list after it is added to the project
  spec.extra_rdoc_files = Dir["README.md", "LICENSE.txt"]
  spec.rdoc_options += [
    "--title", "Dc Metrics - ruby implementation",
    "--main", "README.md",
    "--line-numbers",
    "--inline-source",
    "--quiet"
  ]
  # TODO: define lowest version of ruby
  # spec.required_ruby_version = ">= 2.5.0"

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "google-protobuf", " ~> 3.0"
end

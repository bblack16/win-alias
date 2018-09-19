
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "win_alias/version"

Gem::Specification.new do |spec|
  spec.name          = "win_alias"
  spec.version       = WinAlias::VERSION
  spec.authors       = ["bblack16"]
  spec.email         = ["d2sm10@hotmail.com"]

  spec.summary       = %q{CLI to easily create aliases in a Windows environment.}
  spec.description   = %q{Manage simple bat scripts to easily generate aliases in Windows.}
  spec.homepage      = "https://github.com/bblack16/win-alias"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = ['win-alias']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency 'bblib', '~> 2.0'
end

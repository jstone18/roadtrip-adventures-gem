
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "roadtrip_adventures/version"

Gem::Specification.new do |spec|
  spec.name          = "roadtrip_adventures"
  spec.version       = RoadtripAdventures::VERSION
  spec.authors       = ["Jason Stone"]
  spec.email         = ["jason.stone0808@gmail.com"]

  spec.summary       = %q{Ruby gem of roadtrip destinations and experiences. }
  spec.description   = %q{Ruby gem that allows you to view Lonley Planet's travel destinations and experiences. There are 10 destinations along with 6 different experiences for each destination. }
  spec.homepage      = "https://github.com/jstone18/roadtrip-adventures-gem"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"



end

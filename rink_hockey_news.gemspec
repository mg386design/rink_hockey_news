Gem::Specification.new do |spec|
  spec.name          = "rink_hockey_news"
  spec.version       = "0.1.0"
  spec.authors       = ["mg385"]
  spec.summary       = "Daily news for England U17 and ECU Rink Hockey"
  spec.files         = Dir["lib/**/*", ".github/**/*"]
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.15"
  spec.add_dependency "httparty", "~> 0.21"
end
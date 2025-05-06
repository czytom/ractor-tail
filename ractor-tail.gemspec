Gem::Specification.new do |spec|
  spec.name          = "ractor-tail"
  spec.version       = "0.1.0"
  spec.authors       = ["Krzysztof Tomczyk"]
  spec.email         = ["czytom@gmail.com"]

  spec.summary       = "Ractor-safe file tailing library with logrotate support"
  spec.description   = "Watch files safely from within Ractors with support for rotation (inode detection)."
  spec.license       = "MIT"
  spec.homepage      = ""

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest"
end

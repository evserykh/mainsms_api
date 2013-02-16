$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mainsms_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mainsms_api"
  s.version     = MainsmsApi::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MainsmsApi."
  s.description = "TODO: Description of MainsmsApi."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "active_attr", "~> 0.7.0"
  s.add_dependency "activesupport", "~> 3.1"
  s.add_dependency "hashie", "~> 1.2.0"
  s.add_dependency "httparty", "~> 0.10.2"

  s.add_development_dependency "rspec"
end

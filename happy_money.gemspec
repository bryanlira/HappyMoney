$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "happy_money/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "happy_money"
  s.version     = HappyMoney::VERSION
  s.authors     = ["bryan"]
  s.email       = ["bryanx5163@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of HappyMoney."
  s.description = "TODO: Description of HappyMoney."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end

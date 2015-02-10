$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "formatted_form/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "formatted_form"
  s.version     = FormattedForm::VERSION
  s.authors     = ["benji"]
  s.email       = ["benj_cous@hotmail.com"]
  s.homepage    = "github.com/becousae/formatted_form"
  s.summary     = "Formatting forms."
  s.description = "Formatting forms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end

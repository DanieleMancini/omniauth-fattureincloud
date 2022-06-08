require File.expand_path("../lib/omniauth/fatture_in_cloud/version", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Daniele Mancini"]
  gem.email         = ["daniele@socialacademy.com"]
  gem.description   = "OAuth strategy for Fatture in Cloud."
  gem.summary       = gem.description
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.add_dependency 'omniauth', '~> 1.3'
  gem.add_dependency 'omniauth-oauth2', '~> 1.4'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-fatture-in-cloud"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::FattureInCloud::VERSION
end

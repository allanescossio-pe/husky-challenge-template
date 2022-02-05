require_relative "lib/application/base/version"

Gem::Specification.new do |spec|
  spec.name        = "application-base"
  spec.version     = Application::Base::VERSION
  spec.authors     = ["allanescossio"]
  spec.email       = ["allanjohnson.pe@gmail.com"]
  spec.homepage    = "https://husky-test.com.br"
  spec.summary     = "Armazena todas as classes comuns a todos os projetos"
  spec.description = spec.summary
  spec.license     = "MIT"

  spec.metadata["allowed_push_host"] = "https://github.com/allanescossio-pe/husky-challenge-template"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "7.0.1"
end

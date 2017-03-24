# -*- encoding: utf-8 -*-

require File.expand_path('../lib/rspec-middlewares/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "rspec-middlewares"
  gem.version       = RspecMiddlewares::VERSION
  gem.summary       = "Rspec middleware meta helpers"
  gem.description   = "."
  gem.license       = "MIT"
  gem.authors       = ["Bram Whillock"]
  gem.email         = "bramski@gmail.com"
  gem.homepage      = "https://github.com/imrealtor/rspec-middlewares"
  gem.required_ruby_version = '~> 2.3'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency "rspec", "~> 3.0"
  gem.add_dependency 'ibciss-middleware', "~> 0.4.0"

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rspec', '~> 3.3'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
end

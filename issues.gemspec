require File.expand_path('../lib/issues/version', __FILE__)
spec = Gem::Specification.new do |s| 
  s.name = 'issues'
  s.version = Issues::VERSION
  s.author = 'Marcin Ciunelis'
  s.email = 'marcin.ciunelis@gmail.com'
  s.homepage = 'https://github.com/martinciu/issues'
  s.platform = Gem::Platform::RUBY
  s.summary = 'GitHub Issues Command Line Interface'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','issues.rdoc']
  s.rdoc_options << '--title' << 'issues' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.add_dependency 'gli', ['>=1.5.1']
  s.add_dependency 'virtus', ['>=0.4.0']
  s.add_dependency 'faraday', ['>=0.7.6']
  s.add_dependency 'json', ['>=1.6.5']
  s.add_development_dependency 'rake', ['>=0.9.2.2']
  s.add_development_dependency 'rdoc', ['>=3.12']
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end

# -*- encoding: utf-8 -*-
# stub: zxcvbn-ruby 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "zxcvbn-ruby"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Steve Hodgkiss", "Matthieu Aussaguel"]
  s.date = "2015-04-28"
  s.description = "Ruby port of Dropboxs zxcvbn.js"
  s.email = ["steve@hodgkiss.me", "matthieu.aussaguel@gmail.com"]
  s.homepage = "http://github.com/envato/zxcvbn-ruby"
  s.rubygems_version = "2.4.6"
  s.summary = ""

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<therubyracer>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<therubyracer>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<therubyracer>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

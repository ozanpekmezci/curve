# -*- encoding: utf-8 -*-
# stub: devise_zxcvbn 1.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "devise_zxcvbn"
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Matthew Ford"]
  s.date = "2015-11-27"
  s.description = "It adds password strength checking via ruby-zxcvbn to reject weak passwords "
  s.email = ["matt@bitzesty.com"]
  s.homepage = "https://github.com/bitzesty/devise_zxcvbn"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Devise plugin to reject weak passwords"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_runtime_dependency(%q<devise>, [">= 0"])
      s.add_runtime_dependency(%q<zxcvbn-ruby>, [">= 0.0.2"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<devise>, [">= 0"])
      s.add_dependency(%q<zxcvbn-ruby>, [">= 0.0.2"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<devise>, [">= 0"])
    s.add_dependency(%q<zxcvbn-ruby>, [">= 0.0.2"])
  end
end

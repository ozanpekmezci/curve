# -*- encoding: utf-8 -*-
# stub: actioncable 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "actioncable"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Pratik Naik", "David Heinemeier Hansson"]
  s.date = "2015-12-15"
  s.description = "Structure many real-time application concerns into channels over a single WebSocket connection."
  s.email = ["pratiknaik@gmail.com", "david@heinemeierhansson.com"]
  s.files = ["README.md", "lib/action_cable", "lib/action_cable.rb", "lib/action_cable/channel", "lib/action_cable/channel.rb", "lib/action_cable/channel/base.rb", "lib/action_cable/channel/broadcasting.rb", "lib/action_cable/channel/callbacks.rb", "lib/action_cable/channel/naming.rb", "lib/action_cable/channel/periodic_timers.rb", "lib/action_cable/channel/streams.rb", "lib/action_cable/connection", "lib/action_cable/connection.rb", "lib/action_cable/connection/authorization.rb", "lib/action_cable/connection/base.rb", "lib/action_cable/connection/identification.rb", "lib/action_cable/connection/internal_channel.rb", "lib/action_cable/connection/message_buffer.rb", "lib/action_cable/connection/subscriptions.rb", "lib/action_cable/connection/tagged_logger_proxy.rb", "lib/action_cable/connection/web_socket.rb", "lib/action_cable/engine.rb", "lib/action_cable/process", "lib/action_cable/process/logging.rb", "lib/action_cable/remote_connections.rb", "lib/action_cable/server", "lib/action_cable/server.rb", "lib/action_cable/server/base.rb", "lib/action_cable/server/broadcasting.rb", "lib/action_cable/server/configuration.rb", "lib/action_cable/server/connections.rb", "lib/action_cable/server/worker", "lib/action_cable/server/worker.rb", "lib/action_cable/server/worker/active_record_connection_management.rb", "lib/action_cable/version.rb", "lib/actioncable.rb", "lib/assets", "lib/assets/javascripts", "lib/assets/javascripts/cable", "lib/assets/javascripts/cable.coffee.erb", "lib/assets/javascripts/cable/connection.coffee", "lib/assets/javascripts/cable/connection_monitor.coffee", "lib/assets/javascripts/cable/consumer.coffee", "lib/assets/javascripts/cable/subscription.coffee", "lib/assets/javascripts/cable/subscriptions.coffee"]
  s.homepage = "http://rubyonrails.org"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "WebSocket framework for Rails."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 4.2.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 4.2.0"])
      s.add_runtime_dependency(%q<faye-websocket>, ["~> 0.10.0"])
      s.add_runtime_dependency(%q<websocket-driver>, ["~> 0.6.1"])
      s.add_runtime_dependency(%q<celluloid>, ["~> 0.16.0"])
      s.add_runtime_dependency(%q<em-hiredis>, ["~> 0.3.0"])
      s.add_runtime_dependency(%q<redis>, ["~> 3.0"])
      s.add_runtime_dependency(%q<coffee-rails>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<puma>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 4.2.0"])
      s.add_dependency(%q<actionpack>, [">= 4.2.0"])
      s.add_dependency(%q<faye-websocket>, ["~> 0.10.0"])
      s.add_dependency(%q<websocket-driver>, ["~> 0.6.1"])
      s.add_dependency(%q<celluloid>, ["~> 0.16.0"])
      s.add_dependency(%q<em-hiredis>, ["~> 0.3.0"])
      s.add_dependency(%q<redis>, ["~> 3.0"])
      s.add_dependency(%q<coffee-rails>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<puma>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 4.2.0"])
    s.add_dependency(%q<actionpack>, [">= 4.2.0"])
    s.add_dependency(%q<faye-websocket>, ["~> 0.10.0"])
    s.add_dependency(%q<websocket-driver>, ["~> 0.6.1"])
    s.add_dependency(%q<celluloid>, ["~> 0.16.0"])
    s.add_dependency(%q<em-hiredis>, ["~> 0.3.0"])
    s.add_dependency(%q<redis>, ["~> 3.0"])
    s.add_dependency(%q<coffee-rails>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<puma>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end

# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jquery_on_rails}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joe Khoobyar"]
  s.date = %q{2010-05-23}
  s.description = %q{A complete replacement for Rails 3 javascript helpers and unobstrusive javacript (ujs) using JQuery instead of prototype/scriptaculous}
  s.email = %q{joe@ankhcraft.com}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc", "Rakefile", "VERSION", "jquery_on_rails.gemspec", "lib/jquery_on_rails.rb", "lib/jquery_on_rails/helpers/jquery_helper.rb", "lib/jquery_on_rails/helpers/jquery_ui_helper.rb", "lib/jquery_on_rails/railtie.rb", "public/javascripts/jquery-ui-effects.js", "public/javascripts/jquery.js", "public/javascripts/rails.js", "spec/dummy/app/controllers/dummy_controller.rb", "spec/dummy/app/helpers/dummy_helper.rb", "spec/dummy/config/application.rb", "spec/dummy/config/boot.rb", "spec/dummy/config/environment.rb", "spec/dummy/config/environments/test.rb", "spec/dummy/config/routes.rb", "spec/dummy/log/test.log", "spec/jquery_helper_spec.rb", "spec/jquery_on_rails_spec.rb", "spec/jquery_ui_helper_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/joekhoobyar/jquery_on_rails}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{jquery_on_rails}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{JQuery on Rails - Replace prototype/scriptaculous with jquery}
  s.test_files = ["spec/dummy/app/controllers/dummy_controller.rb", "spec/dummy/app/helpers/dummy_helper.rb", "spec/dummy/config/application.rb", "spec/dummy/config/boot.rb", "spec/dummy/config/environment.rb", "spec/dummy/config/environments/test.rb", "spec/dummy/config/routes.rb", "spec/jquery_helper_spec.rb", "spec/jquery_on_rails_spec.rb", "spec/jquery_ui_helper_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 3.0.0.beta1"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.0.beta.8"])
    else
      s.add_dependency(%q<actionpack>, [">= 3.0.0.beta1"])
      s.add_dependency(%q<rspec>, [">= 2.0.0.beta.8"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 3.0.0.beta1"])
    s.add_dependency(%q<rspec>, [">= 2.0.0.beta.8"])
  end
end

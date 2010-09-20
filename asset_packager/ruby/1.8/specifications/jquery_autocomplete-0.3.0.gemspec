# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jquery_autocomplete}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michele Franzin"]
  s.date = %q{2010-08-28}
  s.description = %q{Adds autocomplete support to rails inputs, using jQuery-UI; it works similarly to the original rails autocomplete plugin, but generating unobtrusive javascript.}
  s.email = %q{michele.franzin@gmail.com}
  s.extra_rdoc_files = ["LICENSE", "README.textile"]
  s.files = ["CHANGELOG", "LICENSE", "README.textile", "Rakefile", "VERSION", "init.rb", "lib/jquery_autocomplete.rb", "lib/jquery_autocomplete_form_builder_helper.rb", "lib/jquery_autocomplete_macros_helper.rb", "lib/jquery_autocomplete_tag_helper.rb", "rails/init.rb", "test/jquery_autocomplete_test.rb"]
  s.homepage = %q{http://github.com/michelefranzin/jquery_autocomplete}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{rails autocomplete using jQuery-UI widget}
  s.test_files = ["test/jquery_autocomplete_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<yard>, [">= 0.5.4"])
      s.add_runtime_dependency(%q<rails>, [">= 2.1"])
    else
      s.add_dependency(%q<yard>, [">= 0.5.4"])
      s.add_dependency(%q<rails>, [">= 2.1"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0.5.4"])
    s.add_dependency(%q<rails>, [">= 2.1"])
  end
end

# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{asset_packager}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dieinzige"]
  s.date = %q{2010-03-15}
  s.description = %q{Minify for rails js and css}
  s.email = %q{dieinzige@gmail.com}
  s.extra_rdoc_files = ["README"]
  s.files = ["CHANGELOG", "README", "Rakefile", "about.yml", "init.rb", "install.rb", "lib/jsmin.rb", "lib/synthesis/asset_package.rb", "lib/synthesis/asset_package_helper.rb", "tasks/asset_packager_tasks.rake", "test/asset_package_helper_development_test.rb", "test/asset_package_helper_production_test.rb", "test/asset_packager_test.rb", "test/asset_packages.yml", "test/assets/javascripts/application.js", "test/assets/javascripts/bar.js", "test/assets/javascripts/controls.js", "test/assets/javascripts/dragdrop.js", "test/assets/javascripts/effects.js", "test/assets/javascripts/foo.js", "test/assets/javascripts/prototype.js", "test/assets/stylesheets/bar.css", "test/assets/stylesheets/foo.css", "test/assets/stylesheets/header.css", "test/assets/stylesheets/screen.css", "test/assets/stylesheets/subdir/bar.css", "test/assets/stylesheets/subdir/foo.css"]
  s.homepage = %q{http://github.com/Dieinzige/asset_packager}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Packager for rails js and css}
  s.test_files = ["test/asset_package_helper_development_test.rb", "test/asset_package_helper_production_test.rb", "test/asset_packager_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

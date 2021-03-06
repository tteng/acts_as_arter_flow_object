# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_arter_flow_object}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["tim.teng"]
  s.date = %q{2010-04-28}
  s.description = %q{simple progress indicator for game arters }
  s.email = %q{tim.rubist@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "acts_as_arter_flow_object.gemspec",
     "generators/acts_as_arter_flow_object/USAGE",
     "generators/acts_as_arter_flow_object/acts_as_arter_flow_object_generator.rb",
     "generators/acts_as_arter_flow_object/templates/migration.rb",
     "generators/acts_as_arter_flow_object/templates/models/arter_flow_object.rb",
     "lib/acts_as_arter_flow_object.rb",
     "lib/afo/acts_as_afo.rb",
     "test/helper.rb",
     "test/test_acts_as_arter_flow_object.rb"
  ]
  s.homepage = %q{http://github.com/tteng/acts_as_arter_flow_object}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{a simple flow marker for game arter in sgf.com}
  s.test_files = [
    "test/helper.rb",
     "test/test_acts_as_arter_flow_object.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end


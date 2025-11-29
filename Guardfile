# frozen_string_literal: true

ignore %r{tmp/*}

group :fast_fail, halt_on_fail: true do
  guard :rubocop, YAML.load_file('nix/pure/guard/config/rubocop.yml') do
    watch(%r{.+\.rb$})
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { File.dirname(it[0]) }
  end

  guard :rspec, YAML.load_file('nix/pure/guard/config/rspec.yml') do
    require 'guard/rspec/dsl'
    dsl = Guard::RSpec::Dsl.new(self)

    # Feel free to open issues for suggestions and improvements

    # RSpec files
    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec.call("support_spec/#{it[1]}") }
    watch(rspec.spec_files)

    # Ruby files
    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)
  end
end

# frozen_string_literal: true

File.read('.gitignore').split("\n").each do |path|
  ignore %r{#{path}/*}
end

CONFIG_PATH = "#{__dir__}/nix/pure/guard/config".freeze

watch("#{CONFIG_PATH}/*.yml") do
  UI.info "Exiting guard because #{CONFIG_PATH}/ changed"
  exit 0
end

group :fast_fail, halt_on_fail: true do
  guard :rubocop, YAML.load_file("#{CONFIG_PATH}/rubocop.yml") do
    watch(%r{.+\.rb$})
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { File.dirname(it[0]) }
  end

  guard :rspec, YAML.load_file("#{CONFIG_PATH}/rspec.yml") do
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

    # nixsh files
    watch(%r{(.+)\.nixsh$}) { rspec.spec.call(it[0]) }
  end
end

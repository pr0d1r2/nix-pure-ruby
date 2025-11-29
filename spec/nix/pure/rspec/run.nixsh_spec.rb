# frozen_string_literal: true

require 'tempfile'

RSpec.describe 'nix/pure/rspec/run.nixsh' do
  subject(:lines) { stdout.strip.split("\n") }

  before { system(environment, command_line) }

  after do
    File.unlink(stdout_log)
    File.unlink(stderr_log) unless stderr_log == File::NULL
  end

  let(:command_line) { "#{command} #{params} 1>#{stdout_log} 2>#{stderr_log}" }

  let(:command) { 'nix/pure/rspec/run.nixsh' }
  let(:params) { '--version' }

  let(:stdout) { stdout_tempfile.read }
  let(:stdout_log) { stdout_tempfile.path }
  let(:stdout_tempfile) { Tempfile.create }

  let(:stderr_log) { File::NULL }

  let(:environment) do
    {
      path:,
    }.transform_keys { it.to_s.upcase }
  end
  let(:path) { '/nix/var/nix/profiles/default/bin' }

  specify do
    expect(lines).to include('RSpec 3.13')
      .and include('  - rspec-core 3.13.6')
      .and include('  - rspec-expectations 3.13.5')
      .and include('  - rspec-mocks 3.13.7')
      .and include('  - rspec-support 3.13.6')
  end

  describe 'errors' do
    subject { stderr.strip }

    let(:stderr) { stderr_tempfile.read }
    let(:stderr_log) { stderr_tempfile.path }
    let(:stderr_tempfile) { Tempfile.create }

    it { is_expected.to be_empty }
  end
end

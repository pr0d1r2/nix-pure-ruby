# frozen_string_literal: true

require 'tempfile'

RSpec.describe 'nix/pure/rubocop/run.nixsh' do
  subject { stdout.strip }

  before { system(environment, command_line) }

  after do
    File.unlink(stdout_log)
    File.unlink(stderr_log) unless stderr_log == File::NULL
  end

  let(:command_line) { "#{command} #{params} 1>#{stdout_log} 2>#{stderr_log}" }

  let(:command) { 'nix/pure/rubocop/run.nixsh' }
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

  it { is_expected.to eq('1.81.6') }

  describe 'errors' do
    subject { stderr.strip }

    let(:stderr) { stderr_tempfile.read }
    let(:stderr_log) { stderr_tempfile.path }
    let(:stderr_tempfile) { Tempfile.create }

    it { is_expected.to be_empty }
  end
end

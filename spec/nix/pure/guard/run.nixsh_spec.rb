# frozen_string_literal: true

require 'tempfile'

RSpec.describe 'nix/pure/guard/run.nixsh' do
  subject { stdout.strip }

  before { system(environment, command_line) }

  after do
    File.unlink(stdout_log)
    File.unlink(stderr_log) unless stderr_log == "/dev/null"
  end

  let(:command_line) { "#{command} #{params} 1>#{stdout_log} 2>#{stderr_log}" }

  let(:command) { 'nix/pure/guard/run.nixsh' }
  let(:params) { '--version' }

  let(:stdout) { stdout_tempfile.read }
  let(:stdout_log) { stdout_tempfile.path }
  let(:stdout_tempfile) { Tempfile.create }

  let(:stderr_log) { '/dev/null' }

  let(:environment) do
    {
      path:
    }.transform_keys { it.to_s.upcase }
  end
  let(:path) { '/nix/var/nix/profiles/default/bin' }

  it { is_expected.to eq('Guard version 2.19.1') }

  describe "errors" do
    subject { stderr.strip }

    let(:stderr) { stderr_tempfile.read }
    let(:stderr_log) { stderr_tempfile.path }
    let(:stderr_tempfile) { Tempfile.create }

    it { is_expected.to be_empty }
  end
end

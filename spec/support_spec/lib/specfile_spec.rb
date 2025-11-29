# frozen_string_literal: true

require 'spec_helper'

require_relative '../../support/lib/specfile'

RSpec.describe Specfile do
  subject(:instance) { described_class.instance }

  let(:expected_contents) do
    %w[
      spec/spec_helper.rb
      spec/support/coverage/all.rb
      spec/support/coverage/partial.rb
      spec/support/index.rb
      spec/support/simplecov.rb
    ] + runnable_contents
  end
  let(:runnable_contents) do
    %w[
      spec/nix/pure/rubocop/run.nixsh_spec.rb
      spec/nix/pure/guard/run.nixsh_spec.rb
      spec/nix/pure/rspec/run.nixsh_spec.rb
      spec/standards/rspec/coverage_spec.rb
      spec/support_spec/lib/nixshfile_spec.rb
      spec/support_spec/lib/rubyfile_spec.rb
      spec/support_spec/lib/specfile_spec.rb
      spec/support_spec/lib/spec_name_spec.rb
    ]
  end

  shared_context 'with all' do
    let(:configuration) { RSpec.configuration }
    let(:files_to_run) { configuration.files_to_run }

    let(:size) { 1 }

    before do
      allow(files_to_run).to receive(:size).and_call_original
      allow(files_to_run).to receive(:size).and_return(size)
    end
  end

  describe '.all' do
    subject { described_class.all }

    it { is_expected.to be_an(Array) }
    it { is_expected.to match_array(expected_contents) }
  end

  describe '.all_run?' do
    subject { described_class.all_run? }

    include_context 'with all'

    it { is_expected.to be_falsey }

    context 'when running all runnables' do
      let(:size) { described_class.runnable.size }

      it { is_expected.to be_truthy }
    end
  end

  describe '.ancestors' do
    subject { described_class.ancestors }

    it { is_expected.to include(Singleton) }
  end

  describe '.regexp' do
    subject { described_class.regexp }

    it { is_expected.to be_a(Regexp) }
    it { is_expected.to match(expected_contents.sample) }
  end

  describe '.runnable' do
    subject { described_class.runnable }

    it { is_expected.to be_an(Array) }
    it { is_expected.to match_array(runnable_contents) }
  end

  describe '#all' do
    subject { instance.all }

    it { is_expected.to be_an(Array) }
    it { is_expected.to match_array(expected_contents) }
  end

  describe '#all_run?' do
    subject { instance.all_run? }

    include_context 'with all'

    it { is_expected.to be_falsey }

    context 'when running all runnables' do
      let(:size) { described_class.runnable.size }

      it { is_expected.to be_truthy }
    end
  end

  describe '#runnable' do
    subject { instance.runnable }

    it { is_expected.to be_an(Array) }
    it { is_expected.to match_array(runnable_contents) }
  end

  describe '#regexp' do
    subject { instance.regexp }

    it { is_expected.to be_a(Regexp) }
    it { is_expected.to match(expected_contents.sample) }
  end

  describe 'private' do
    subject { instance.__send__(method) }

    describe '#specs' do
      let(:method) { :specs }

      it { is_expected.to be_an(Array) }
      it { is_expected.to match_array(expected_contents) }
    end
  end
end

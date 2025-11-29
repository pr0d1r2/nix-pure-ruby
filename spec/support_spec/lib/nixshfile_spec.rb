# frozen_string_literal: true

require 'spec_helper'

require_relative '../../support/lib/nixshfile'

RSpec.describe Nixshfile do
  subject(:instance) { described_class.instance }

  let(:expected_contents) do
    %w[
      nix/pure/guard/run.nixsh
      nix/pure/rspec/run.nixsh
      nix/pure/rubocop/run.nixsh
    ]
  end

  describe '.all' do
    subject { described_class.all }

    it { is_expected.to be_an(Array) }
    it { is_expected.to match_array(expected_contents) }
  end

  describe '#all' do
    subject { instance.all }

    it { is_expected.to be_an(Array) }
    it { is_expected.to match_array(expected_contents) }
  end

  describe 'private' do
    subject { instance.__send__(method) }

    let(:expected_contents) do
      %w[
        nix/pure/guard/update.nixsh
        nix/pure/rspec/update.nixsh
        nix/pure/rubocop/update.nixsh
        nix/sources.update.nixsh
      ]
    end

    describe '#non_coverable' do
      let(:method) { :non_coverable }

      it { is_expected.to be_an(Array) }
      it { is_expected.to match_array(expected_contents) }
    end
  end
end

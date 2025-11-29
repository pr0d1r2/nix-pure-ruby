# frozen_string_literal: true

require 'spec_helper'

require_relative '../../support/lib/rubyfile'

RSpec.describe Rubyfile do
  subject(:instance) { described_class.instance }

  let(:expected_contents) do
    %w[
      spec/support/lib/nixshfile.rb
      spec/support/lib/rubyfile.rb
      spec/support/lib/spec_name.rb
      spec/support/lib/specfile.rb
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

    describe '#non_specs' do
      let(:method) { :non_specs }

      it { is_expected.to be_an(Array) }
      it { is_expected.to match_array(expected_contents) }
    end
  end
end

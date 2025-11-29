# frozen_string_literal: true

require 'spec_helper'

require_relative '../../support/lib/spec_name'

RSpec.describe SpecName, :spec_name do
  subject(:instance) { described_class.new(implementation) }

  let(:implementation) { 'lib/example.rb' }

  shared_examples 'implementation yields' do |file, expected|
    context "with #{file}" do
      let(:implementation) { file }

      it { is_expected.to eq(expected) }
    end
  end

  describe '#spec' do
    subject { instance.spec }

    it { is_expected.to eq('spec/lib/example_spec.rb') }

    it_behaves_like 'implementation yields',
                    'spec/support/lib/rubyfile.rb',
                    'spec/support_spec/lib/rubyfile_spec.rb'
  end

  describe 'private' do
    subject { instance.__send__(method) }

    describe '#implementation_without_suffix' do
      let(:method) { :implementation_without_suffix }

      it { is_expected.to eq('lib/example') }

      it_behaves_like 'implementation yields',
                      'spec/support/lib/rubyfile.rb',
                      'support_spec/lib/rubyfile'
    end
  end
end

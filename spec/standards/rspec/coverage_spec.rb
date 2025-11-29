# frozen_string_literal: true

require 'spec_helper'

require 'support/lib/nixshfile'
require 'support/lib/rubyfile'
require 'support/lib/spec_name'

RSpec.describe 'RSpec coverage' do
  shared_examples 'have spec' do |implementation|
    describe 'spec for implementation' do
      let(:spec_name) { SpecName.new(implementation) }
      let(:spec) { spec_name.spec }

      describe 'file' do
        subject { File }

        let(:message) do
          "Expected '#{spec}' to exist and cover '#{implementation}' !"
        end

        it { is_expected.to exist(spec), message }
      end
    end
  end

  Rubyfile.all.each do |implementation|
    describe implementation do
      it_behaves_like 'have spec', implementation
    end
  end

  Nixshfile.all.each do |implementation|
    describe implementation do
      it_behaves_like 'have spec', implementation
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

require_relative '../../support/lib/rubyfile'

RSpec.describe Rubyfile do
  subject(:instance) { described_class.instance }

  let(:expected_contents) do
    %w[
      gen/ruby_class.rb
      gen/spec_file.rb
      lib/guard/just/dsl.rb
      robot/enable_rescue.rb
      robot/reset.rb
      spec/support/lib/cached/file.rb
      spec/support/lib/cached/file/lines.rb
      spec/support/lib/justfile.rb
      spec/support/lib/port_open.rb
      spec/support/lib/rubyfile.rb
      spec/support/lib/spec_gen.rb
      spec/support/lib/spec_name.rb
      spec/support/lib/specfile.rb
      streamline/next_commit_date_yesterday.rb
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

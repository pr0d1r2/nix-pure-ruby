# frozen_string_literal: true

class SpecName
  private attr_reader :implementation

  def initialize(implementation)
    @implementation = implementation
  end

  def spec
    "spec/#{implementation_without_suffix}_spec.rb"
  end

  private

  def implementation_without_suffix
    implementation.gsub(%r{\.rb$}, '').gsub(%r{^spec/support}, 'support_spec')
  end
end

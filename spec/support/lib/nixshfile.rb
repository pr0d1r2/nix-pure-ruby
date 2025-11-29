# frozen_string_literal: true

require 'singleton'

class Nixshfile
  include Singleton

  REGEXP = '**/*.nixsh'

  private_constant :REGEXP

  def self.all
    instance.all
  end

  def all
    @all ||= Dir.glob(REGEXP)
  end
end

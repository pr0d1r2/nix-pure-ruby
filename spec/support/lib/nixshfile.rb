# frozen_string_literal: true

require 'singleton'

class Nixshfile
  include Singleton

  REGEXP = '**/*.nixsh'
  NON_COVERABLE = '**/*update.nixsh'

  private_constant :REGEXP
  private_constant :NON_COVERABLE

  def self.all
    instance.all
  end

  def all
    @all ||= Dir.glob(REGEXP).reject { non_coverable.include? it }
  end

  private

  def non_coverable
    @non_coverable ||= Dir.glob(NON_COVERABLE)
  end
end

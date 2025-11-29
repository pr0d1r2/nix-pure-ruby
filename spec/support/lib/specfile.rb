# frozen_string_literal: true

require 'singleton'

class Specfile
  include Singleton

  GLOB = 'spec/**/*.rb'
  BASE_REGEXP = %r{^spec/.*_(spec|factory|helper)\.rb$}
  SUPPORT_REGEXP = %r{^spec/support(?!/lib)/}

  private_constant :GLOB
  private_constant :BASE_REGEXP
  private_constant :SUPPORT_REGEXP

  def self.all
    instance.all
  end

  def self.all_run?
    instance.all_run?
  end

  def self.runnable
    instance.runnable
  end

  def self.regexp
    instance.regexp
  end

  def regexp
    Regexp.union(BASE_REGEXP, SUPPORT_REGEXP)
  end

  def all
    @all ||= specs.reject { File.symlink?(it) }
  end

  def all_run?
    runnable.size == running_size
  end

  def runnable
    @runnable ||= all.select { it.end_with?('_spec.rb') }
  end

  private

  def specs
    Dir.glob(GLOB).grep(regexp)
  end

  def running_size
    RSpec.configuration.files_to_run.size
  end
end

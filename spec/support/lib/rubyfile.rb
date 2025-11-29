# frozen_string_literal: true

require 'singleton'

require_relative 'specfile'

class Rubyfile
  include Singleton

  GLOB = '**/*.rb'

  private_constant :GLOB

  def self.all
    instance.all
  end

  def all
    @all ||= non_specs.reject { File.symlink?(it) }
  end

  private

  def non_specs
    Dir.glob(GLOB).grep_v(Specfile.regexp)
  end
end

require 'virtus'
require 'faraday'
require 'json'
require 'singleton'

require 'issues/version'
require 'issues/github'
require 'issues/user'
require 'issues/repo'
require 'issues/milestone'

module Issues
  
  class << self
    attr_accessor :repo
  end

end

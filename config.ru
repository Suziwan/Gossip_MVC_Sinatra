require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'

run ApplicationController

# Dans le terminal : $ rackup
# http://localhost:9292/

# $ rackup -p 4567
# http://localhost:4567/
# http://localhost:4567/gossips/new
# -*- coding: utf-8 -*-

require 'sinatra'
require 'sinatra/config_file'
require "sinatra/reloader" if development?
require 'faraday'
require 'faraday_middleware'
require 'rdiscount'
require 'multi_json'

require_relative 'lib/helpers'

configure do
  config_file 'config/settings.yml'

  set :environment, :development
  set :markdown, :layout_engine => :erb, :layout => :layout

  file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
  file.sync = true
  use Rack::CommonLogger, file
end

get '/' do
  markdown :README
end
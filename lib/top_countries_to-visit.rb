# environment file - signle file that top_countries_to_visit_2018 requires and this file loads all the other dependencies
require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './top_countries_to_visit_2018/version'
require_relative './top_countries_to_visit_2018/cli.rb'
require_relative './top_countries_to_visit_2018/scraper.rb'

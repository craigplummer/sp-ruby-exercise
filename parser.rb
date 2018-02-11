#!/usr/bin/env ruby

require_relative 'lib/log_file_parser'

PageViews.new(ARGV[0]).display

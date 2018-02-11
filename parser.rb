#!/usr/bin/env ruby

require_relative 'lib/log_file_parser'

LogFileParser.new(ARGV[0]).parse

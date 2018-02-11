#!/usr/bin/env ruby

require_relative 'lib/page_views'

PageViews.new(ARGV[0]).perform

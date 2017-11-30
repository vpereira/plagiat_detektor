require "plagiat_detektor/version"
require_relative "plagiat_detektor/diff"
require_relative "plagiat_detektor/search_file"
require_relative "plagiat_detektor/option_parser"

module PlagiatDetektor
  # remove preprocessor and comments
  class << self
    def clean_file(fi)
      File.readlines(fi).reject { |l| l.start_with?('#') || l =~ /\/\*.*\*\//m || l =~ /^\s*?$/ }
    end
  end
end

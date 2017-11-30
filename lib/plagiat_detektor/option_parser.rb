require 'optparse'
require 'ostruct'

module PlagiatDetektor
class OptionParser


  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.library = []
    options.numprocs = 4
    options.threshold = 0.6
    options.source = nil
    options.destination = nil
    options.verbose = false

    ::OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} -s <directory1> -d <directory2> [-n <# of process>][-t <threshold>]"
      opts.on("-s","--source DIRECTORY","mandatory DIRECTORY") do |s|
        # TODO
        # validate it
        options.source = s
      end
      opts.on("-d","--destination DIRECTORY","mandatory DIRECTORY") do |d|
        # TODO
        # validate it
        options.destination = d
      end
      opts.on("-t","--threshold THRESHOLD", "Threshold of similarity: default 0.6") do |t|
        options.threshold = t.to_f
      end
      opts.on("-n","--number of parallel PROCESSES", "Number of parallel processes: default 4") do |n|
        options.numprocs = n.to_i
      end
      opts.separator ""
      opts.separator "Common options:"

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

      # Another typical switch to print the version.
      opts.on_tail("--version", "Show version") do
        puts ::PlagiatDetektor::VERSION
        exit
      end
    end.parse!(args)
    options
  end  # parse()
end  # class OptionParser
end

# options = OptparseExample.parse(ARGV)
# pp options
#pp ARGV

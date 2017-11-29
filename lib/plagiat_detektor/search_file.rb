#
# TODO
#
module PlagiatDetektor
  class SearchFile
    attr_accessor :directory, :recursive, :extension
    # class methods
    class << self
      def product(f1, f2)
        f1.product(f2)
      end
    end

    def initialize(directory, extension=".c",  recursive=false)
      @directory = directory
      @recursive = recursive
      @extension = ".c"
    end

    def search
      if recursive?
        Dir["#{directory}/*.#{extension}"]
      else
        Dir.glob "#{directory}/**/*#{extension}"
      end
    end

    private
    def recursive?
      !!@recursive
    end
  end
end

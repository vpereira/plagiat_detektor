require "test_helper"

class PlagiatDetektorBasicTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PlagiatDetektor::VERSION
  end

  def test_parse_works
    refute_nil ::PlagiatDetektor::OptionParser.parse(["-s foo -d bar"])
  end
end

class PlagiatDetektorDefaults < Minitest::Test
  def setup
    @p = ::PlagiatDetektor::OptionParser.parse(["-s foo -d bar"])
  end
  def test_defaults
    assert @p.numprocs, 4
    assert @p.threshold, 0.6
  end
end

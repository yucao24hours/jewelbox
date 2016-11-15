require "minitest/autorun"
require_relative "./version"

class VersionTest < MiniTest::Test
  def setup
    @v1 = Version.new("2.1.1")
    @v2 = Version.new("2.3.1")
  end

  def test_version_compare
    refute_equal(@v1, @v2)
    assert_operator(@v1, :<, @v2)
  end

  def test_major_number
    assert_equal(2, @v2.major, "major")
    assert_equal(3, @v2.minor, "minor")
    assert_equal(1, @v2.patch, "patch")
  end
end

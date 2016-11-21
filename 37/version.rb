# Represents a version number with three components:
#
# * Major number: (1 in +1.2.3+)
# * Minor number: (2 in +1.2.3+)
# * Patch level: (3 in +1.2.3+)
#
# このクラスは 3 つの数字からなる Version を表します。
#
# Example:
#   v = Version.new("10.9.16")
#   v.major # => 10
class Version
  include Comparable
  attr_reader :major, :minor, :patch

  # Parses the given version string and creates
  # a new Version object.
  def initialize(version)
    @major, @minor, @patch =
      version.split(".").map(&:to_i)
  end

 alias_method :eql?, :==

  def <=>(other)
    return nil unless other.is_a?(Version)

    [ major <=> other.major,
      minor <=> other.minor,
      patch <=> other.patch
    ].detect{|n| !n.zero? } || 0
  end
end

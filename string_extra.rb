require "forwardable"

class StringExtra
  extend(Forwardable)
  def_delegators(:@string, *String.public_instance_methods(false))

  ONLY_SPACE_UNICODE_RE = %r/\A[[:space:]]*\z/

  def initialize(str = "")
    @string = str
  end

  def only_space?
    if ascii_only?
      !self.bytes.any?{|b| b != 32 && !b.between?(9, 13) }
    else
      ONLY_SPACE_UNICODE_RE === self
    end
  end
end

module OnlySpace
  ONLY_SPACE_UNICODE_RE = %r/\A[[:space:]]*\z/

  def self.only_space?(str)
    if str.ascii_only?
      !str.bytes.any?{|b| b != 32 && !b.between?(9, 13) }
    else
      ONLY_SPACE_UNICODE_RE === str
    end
  end

  def only_space?
    # モジュール関数に転送
    OnlySpace.only_space?(self)
  end
end

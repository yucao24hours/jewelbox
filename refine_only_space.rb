module OnlySpace
  ONLY_SPACE_UNICODE_RE = %r/\A[[:space:]]*\z/

  refine(String) do
    def only_space?
      if ascii_only?
        !self.bytes.any?{|b| b != 32 && !b.between?(9, 13) }
      else
        ONLY_SPACE_UNICODE_RE === self
      end
    end
  end
end

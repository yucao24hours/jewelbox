module A
  def who_am_i?
    "A#who_am_i?"
  end
end

module B
  def who_am_i?
    "B#who_am_i?"
  end
end

class C
  include(A)
  include(B)

  def who_am_i?
    "C#who_am_i?"
  end
end

class D
  prepend(A)
  prepend(B)

  def who_am_i?
    "D#who_am_i?"
  end
end

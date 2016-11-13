class Stream
  def initialize(io = $stdin, chunk = 64 * 1024)
    @io, @chunk = io, chunk
  end

  def stream(&block)
    loop do
      start = Time.now
      data = @io.read(@chunk)
      return if data.nil?

      time = (Time.now - start).to_f
      block.call(data, time)
    end
  end
end

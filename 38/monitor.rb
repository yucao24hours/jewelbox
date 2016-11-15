require "uri"

class Monitor
  def initialize(server)
    @server = server
  end

  def alive?
    echo = Time.now.to_f.to_s
    response = get(echo)
    response.success? && response.body == echo
  end

  private

    def get(echo)
      url = URI::HTTP.build(host: @server,
                            path: "/echo/#{echo}")
      HTTP.get(url.to_s)
    end
end

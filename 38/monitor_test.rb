require "minitest/autorun"
require_relative "./monitor"

class HttpRequestTest < MiniTest::Test
  def test_successful_monitor
    monitor = Monitor.new("example.com")
    response = MiniTest::Mock.new

    monitor.define_singleton_method(:get) do |echo|
      response.expect(:success?, true)
      response.expect(:body, echo)
      response
    end

    assert(monitor.alive?, "should be alive")
    response.verify
  end

  def test_failed_monitor
    monitor = Monitor.new("example.com")
    response = MiniTest::Mock.new

    monitor.define_singleton_method(:get) do |echo|
      response.expect(:success?, false)
      response
    end

    assert(monitor.alive?, "shouldn't be alive")
    response.verify
  end
end

# This example shows how to use instance_exec
# and the difference between instance_eval and instance_exec.

class Counter
  DEFAULT = 0
  attr_reader :counter

  def initialize(start = DEFAULT)
    @counter = start
  end

  def inc
    @counter += 1
  end
end

module Reset
  def self.reset_var(object, name)
    object.instance_exec("@#{name}".to_sym) do |var|
      const = self.class.const_get(:DEFAULT)
      instance_variable_set(var, const)
    end
  end
end

module PoorReset
  def self.reset_var(object, name)
    object.instance_eval("@#{name} = DEFAULT")
  end
end

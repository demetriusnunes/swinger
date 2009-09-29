java_import org.netbeans.jemmy.TimeoutExpiredException

module Swinger
  module Timeout
    java_import org.netbeans.jemmy.Timeouts

    def set_default_timeout(value)
      @timeout = value
    end
    
    def timeout(name = nil, value = nil, &block)
      name ||= name || "ComponentOperator.WaitComponentTimeout"
      value ||= @timeout || 100
      if block
        old_timeout = Timeouts.get_default(name)
        Timeouts.set_default(name, value)
        block.call
        Timeouts.set_default(name, old_timeout)
      else
        Timeouts.set_default(name, value)
      end
    end

    def expect_timeout(options = {}, &block)
      timeout(options[:id], options[:time]) do
        block.should raise_error(TimeoutExpiredException) 
      end
    end
    
  end
end

World(Swinger::Timeout)
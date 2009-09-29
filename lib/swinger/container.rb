module Swinger
  module Container
    class ContainerUndefinedException < StandardError; end

    class Container
      def set(container)
        @container = container
      end

      def get
        @container
      end
      alias :current :get

      def reset
        @container = nil
      end

      def set?
        !@container.nil?
      end

      def check!(msg = "Component")
        container_check! @container, msg
      end
    end

    def container
      @current_container ||= Container.new
    end

    def container_check!(container = container.current, msg = "Component")
      raise ContainerUndefinedException, "#{msg} container undefined" unless container
    end

  end
end

World(Swinger::Container)
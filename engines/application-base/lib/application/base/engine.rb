module Application
  module Base
    class Engine < ::Rails::Engine
      isolate_namespace Application::Base
    end
  end
end

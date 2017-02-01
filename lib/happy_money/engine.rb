module HappyMoney
  class Engine < ::Rails::Engine
    isolate_namespace HappyMoney

    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end

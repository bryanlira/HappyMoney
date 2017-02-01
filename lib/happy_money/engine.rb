module HappyMoney
  class Engine < ::Rails::Engine
    isolate_namespace HappyMoney

    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end

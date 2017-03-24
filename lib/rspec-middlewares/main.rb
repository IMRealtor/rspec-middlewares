module RspecMiddlewares
  class Main
    def initialize(app)
      @app = app
    end

    def call(env)
      env.fetch(:test).run
    end
  end
end

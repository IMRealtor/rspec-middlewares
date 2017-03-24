module RspecMiddlewares
  class Sidekiq
    def initialize(app)
      @app = app
    end

    def call(env)
      ::Sidekiq::Testing.inline! { @app.call env }
    end
  end
end

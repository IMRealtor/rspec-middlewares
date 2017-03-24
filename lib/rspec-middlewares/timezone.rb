module RspecMiddlewares
  class Timezone
    def initialize(app, timezone:)
      @app = app
      @timezone = timezone
    end

    def call(env)
      Time.use_zone(@timezone) { @app.call env }
    end
  end
end

module RspecMiddlewares
  class Timecop
    def initialize(app, current_time: nil, freeze_time: nil)
      @app = app
      @current_time = current_time
      @freeze_time = freeze_time
    end

    def call(env)
      if @current_time.present?
        ::Timecop.travel(time) { @app.call env }
      elsif @freeze_time.present?
        ::Timecop.travel(frozen_time) { @app.call env }
      end
    end

    private
    def frozen_time
      Time.zone.parse(@freeze_time)
    end

    def time
      Time.zone.parse(@current_time)
    end
  end
end

module RspecMiddlewares
  class VCR
    def initialize(app, cassette_name: nil, record:, match_requests_on:)
      @app = app
      @cassette_name = cassette_name
      @record = record || :once
      @match_requests_on = match_requests_on || [:method, :uri, :body]
    end

    def call(env)
      ::VCR.use_cassette((@cassette_name || derived_cassette_name(env)), record: @record, match_requests_on: @match_requests_on) do
        @app.call env
      end
    end

    def derived_cassette_name(env)
      directory = env[:test].file_path.gsub("_spec.rb", "").gsub("./spec/", "") + "/"
      filename = env[:test].full_description.underscore.downcase.gsub(/[^\w]/, "_")

      directory + filename
    end
  end
end

# rspec-middlewares
A set of helpful middlewares for useage with rspec.

#Useage

```> gem install rspec-middlewares```

In ```spec-helper.rb``` or ```rails_helper.rb```.

```ruby
require 'middleware'
require 'rspec-middlewares'
require 'vcr'

Rspec.configure do |config|
  config.around(:each) do |test|
      stack = Middleware::Builder.new do |builder|
        if test.metadata[:timezone].present?
          builder.use RspecMiddlewares::Timezone, timezone: test.metadata[:timezone]
        end
  
        if test.metadata[:current_time].present?
          builder.use RspecMiddlewares::Timecop, current_time: test.metadata[:current_time]
        end
  
        if test.metadata[:freeze_time].present?
          builder.use RspecMiddlewares::Timecop, freeze_time: test.metadata[:freeze_time]
        end
  
        if test.metadata[:record].present?
          builder.use RspecMiddlewares::VCR,
                      cassette_name: test.metadata[:cassette_name],
                      record: test.metadata[:record],
                      match_requests_on: test.metadata[:match_requests_on]
        end
        builder.use TestMiddlewares::Sidekiq if test.metadata[:run_jobs]
        builder.use TestMiddlewares::Main
      end
  
      stack.call test: test
    end
end

```

Then in your tests
```ruby
require 'rails_helper'

describe MyTest,
         record: :all,
         match_requests_on: [:method, :host, :path] do
  # each of your tests will now be run with the VCR middleware enabled.
end

```

#Related

https://github.com/Ibsciss/ruby-middleware
https://github.com/vcr/vcr


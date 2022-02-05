unless ENV["NO_COVERAGE"]
  require "simplecov"

  SimpleCov.start "rails" do
    minimum_coverage 100
  end
end

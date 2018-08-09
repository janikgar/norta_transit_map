class GetRouteScheduleJob < ApplicationJob
  queue_as :default

  def perform(route_string)
    # Do something later
  end
end

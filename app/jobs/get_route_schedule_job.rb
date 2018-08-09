class GetRouteScheduleJob < ApplicationJob
  queue_as :default

  def perform(route_string)
    
    remote_test = HTTParty.get("https://transit.land/api/v1/schedule_stop_pairs?date=today&operator_onestop_id=o-9vrf-neworleansrta&route_onestop_id=#{route_string}&per_page=1")

  end

  def schedule_exist?(route_string)
    if Schedule.count != 0
      find_schedule = Route.where(route: route_string).pluck(remote_updated_at)
    else
      return false
  end
end

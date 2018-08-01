class PlatformController < ApplicationController
  def view
    @routes = Route.all
    @sorted_routes = sort_routes_by_name(@routes)
  end

  def route
    # if !params[:route]
    #   flash[:notice] = 'Select a route'
    #   redirect_to root_path
    # end
    @route = Route.find(params[:route])
  end

  private
    def sort_routes_by_name(routes)
      sortable_records = []
      routes.select(:name, :id).each do |route|
        name = route[:name].gsub(/\D/, '').to_i # Remove non-digit characters and convert route name to integer so we can sort
        sortable_records.push({name: name, record_id: route[:id]})
      end
      return sortable_records.sort_by{ |record| record[:name] }
    end
  # END private
end

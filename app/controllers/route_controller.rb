class RouteController < ApplicationController
  def create
    these_params = these_params
    these_params[:route_type] = these_params[:route_type].to_i
    these_params[:route_sort_order] = these_params[:route_sort_order].to_i

    @route = Route.create(these_params)
  end

  protected
  def route_params
    params.require(:routes).permit(:route_id, :agency_id, :route_short_name, :route_long_name, :route_desc, :route_type, :route_url, :route_color, :route_text_color, :route_sort_order)
  end
end

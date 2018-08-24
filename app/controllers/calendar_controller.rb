class CalendarController < ApplicationController
  def create
    these_params = calendar_params
    these_params[:monday]  = (these_params[:monday] == 1 ? true : false)
    these_params[:tuesday]  = (these_params[:tuesday] == 1 ? true : false)
    these_params[:wednesday]  = (these_params[:wednesday] == 1 ? true : false)
    these_params[:thursday]  = (these_params[:thursday] == 1 ? true : false)
    these_params[:friday]  = (these_params[:friday] == 1 ? true : false)
    these_params[:saturday]  = (these_params[:saturday] == 1 ? true : false)
    these_params[:sunday]  = (these_params[:sunday] == 1 ? true : false)
    these_params[:start_date] = Date.parse(these_params[:start_date])
    these_params[:end_date] = Date.parse(these_params[:end_date])

    @calendar = Calendar.create(these_params)
  end

  protected
  def calendar_params
    params.require(:calendars).permit(:service_id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :start_date, :end_date)
  end
end

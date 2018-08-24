class ShapeController < ApplicationController
  def create
    these_params = shape_params
    these_params[:shape_pt_lat] = these_params[:shape_pt_lat].to_f
    these_params[:shape_pt_lon] = these_params[:shape_pt_lon].to_f
    these_params[:shape_pt_sequence] = these_params[:shape_pt_sequence].to_i

    @shape = Shape.create(these_params)
  end

  protected
  def shape_params
    params.require(:shapes).permit(:shape_pt_lat, :shape_pt_lon, :shape_id, :shape_pt_sequence, :shape_dist_traveled)
  end
end

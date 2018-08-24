class AggrShapesController < ApplicationController
  def create
    this_shape_id = aggr_shapes_params[:aggr_shape_id]
    shape_ids = Shape.where(shape_id: this_shape_id)
    @aggr_shapes = AggrShape.create(this_shape_id, shape_ids)
  end

  protected
  def aggr_shapes_params
    params.require(:aggr_shapes).permit(:aggr_shape_id, :shape_ids)
  end
end

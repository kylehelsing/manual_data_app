class DataPointsController < ApplicationController
  before_action :set_data_point, only: [:show, :edit, :update, :destroy]

  # GET /data_points
  # GET /data_points.json
  def index
    @data_points = DataPoint.all
  end


  # GET /data_points/new
  def new
    @data_point = DataPoint.new
  end


  # POST /data_points
  # POST /data_points.json
  def create
    @data_point = DataPoint.new(data_point_params)

    respond_to do |format|
      if @data_point.save
        format.html { redirect_to data_points_url, notice: 'Data point was successfully created.' }
        format.json { render :show, status: :created, location: @data_point }
      else
        format.html { render :new }
        format.json { render json: @data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  def dump
    render json: DataPoint.dump, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_point
      @data_point = DataPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_point_params
      params.require(:data_point).permit(:point_type, :point_value, :aux_data)
    end
end

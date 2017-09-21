class Api::V1::VehiclesController < Api::V1::ApplicationController

  # GET /api/v1/vehicles
  def index
    @vehicles = Vehicle.all
  end

  # POST /api/v1/vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)
    Vehicles::LicencePlateParser.call(@vehicle)
    @vehicle.save!

    json_response(@vehicle, :created)
  end

  private
    def vehicle_params
      params.require(:vehicle).permit(:color, :licence_plate, :model)
    end
end

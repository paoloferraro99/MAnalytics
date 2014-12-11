class EventsController < ApplicationController

  before_action :set_cors_response_headers
  skip_before_action :verify_authenticity_token

def create
    @site = Site.find(params[:id])
    @events = @site.events
  end


  private

  def event_params
      params.require(:event).permit(:name, :property_1, :property_2)
  end

  def set_cors_response_headers
    Access-Control-Allow-Origin: *
    Access-Control-Allow-Methods: POST, GET, OPTIONS
    Access-Control-Allow-Headers: Content-Type
    Access-Control-Max-Age: 1728000
  end

end

class EventsController < ApplicationController

  before_action :set_cors_response_headers
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    @site = Site.find(params[:id])
    event = @site.events.build(event_params)

    if event.save
      respond_with "ok"
    else
      respond_with event.errors
    end
  end


  private

  def event_params
      params.require(:event).permit(:name, :property_1, :property_2)
  end

  def set_cors_response_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = "POST, GET, OPTIONS"
    response.headers['Access-Control-Allow-Headers'] = "Content-Type"
    response.headers['Access-Control-Max-Age'] = 1728000
  end

end

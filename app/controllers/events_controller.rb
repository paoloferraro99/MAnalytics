class EventsController < ApplicationController

  #before_action :set_cors_response_headers
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    @site = Site.find(params[:id])
    event = @site.events.build(event_params)


    # miki: grab informatiom from rails request headers, like referer
      # event.origin_url = 

    referer         = request.referer
    page            = request.fullpath
    client_ip       = request.remote_ip
    server_software = request.server_software
    #content_length  = request.content_length
    #body            = request.raw_post

    date            =  request.headers["Date"]
    client_email    =  request.headers["From"] 
    client_browser  =  request.headers["User-Agent"]

    hostname        = request.env["REMOTE_HOST"]
    username        = request.env["HTTP_REMOTE_USER"]s

    if event.save
      render nothing: true, status: 200
    else
      respond_with event.errors
    end
  end


  private

  def event_params
    params.require(:event).permit(:user_id, 
      :site_id, 
      :name, 
      :property_1, 
      :property_2, 
      :referer,
      :page,
      :client_ip,
      :server_software,
      :date,
      :client_email,
      :client_browser,
      :hostname,
      :username)
  end

  # def set_cors_response_headers
  #   response.headers['Access-Control-Allow-Origin'] = '*'
  #   response.headers['Access-Control-Allow-Methods'] = "POST, GET, OPTIONS"
  #   response.headers['Access-Control-Allow-Headers'] = "Content-Type"
  #   response.headers['Access-Control-Max-Age'] = 1728000
  # end

end

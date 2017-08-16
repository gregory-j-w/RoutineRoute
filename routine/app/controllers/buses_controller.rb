class BusesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def busroute
    response = HTTParty.get('http://www.ctabustracker.com/bustime/api/v2/getroutes/?key=54sFweh2PbzUdD4hegTEwqpgk&format=json')
    parsedbuses = JSON.parse(response.body)
    @busroutes = parsedbuses["bustime-response"]["routes"]
  end

  def busdirection
    @rt = params[:rt]
    @rtnm = params[:rtnm]
    response = HTTParty.get('http://www.ctabustracker.com/bustime/api/v2/getdirections/?key=' + '54sFweh2PbzUdD4hegTEwqpgk' + '&rt=' + @rt + '&format=json')
    parseddirections = JSON.parse(response.body)
    @busdirections = parseddirections["bustime-response"]["directions"]
  end

  def busstop
    @rt = params[:rt]
    @rtnm = params[:rtnm]
    @rtdir = params[:rtdir]
    response = HTTParty.get('http://ctabustracker.com/bustime/api/v2/getstops?key=' + '54sFweh2PbzUdD4hegTEwqpgk' + '&rt=' + @rt + '&dir=' + @rtdir + '&format=json')
    parsedstops = JSON.parse(response.body)
    @busstops = parsedstops["bustime-response"]["stops"]
  end

  def bussave
    @rt = params[:rt]
    @rtnm = params[:rtnm]
    @rtdir = params[:rtdir]
    @stpid = params[:stpid]
    @stpnm = params[:stpnm]

  end

  def create
    @bus = current_user.buses.build(bus_params)
    if @bus.save
      flash[:success] = "Route created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def bus_params
      params.require(:bus).permit(:name, :rt, :rtnm, :rtdir, :stpid, :stpnm)
    end
end

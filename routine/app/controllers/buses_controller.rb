class BusesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def busroute
    response = HTTParty.get('http://www.ctabustracker.com/bustime/api/v2/getroutes/?key=' + ENV["CTA_BUS_API_KEY"] + '&format=json')
    parsedbuses = JSON.parse(response.body)
    @busroutes = parsedbuses["bustime-response"]["routes"]
  end

  def busdirection
    @rt = params[:rt]
    @rtnm = params[:rtnm]
    response = HTTParty.get('http://www.ctabustracker.com/bustime/api/v2/getdirections/?key=' + ENV["CTA_BUS_API_KEY"] + '&rt=' + @rt + '&format=json')
    parseddirections = JSON.parse(response.body)
    @busdirections = parseddirections["bustime-response"]["directions"]
  end

  def busstop
    @rt = params[:rt]
    @rtnm = params[:rtnm]
    @rtdir = params[:rtdir]
    response = HTTParty.get('http://ctabustracker.com/bustime/api/v2/getstops?key=' + ENV["CTA_BUS_API_KEY"] + '&rt=' + @rt + '&dir=' + @rtdir + '&format=json')
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
    @id = params[:id]
    @bus = Bus.find(@id)
    @bus.destroy
    flash[:success] = "Route deleted"
    redirect_to request.referrer || current_user
  end


  private

    def bus_params
      params.require(:bus).permit(:name, :rt, :rtnm, :rtdir, :stpid, :stpnm)
    end

    def correct_user
      @bus = current_user.buses.find_by(id: params[:id])
      redirect_to root_url if @bus.nil?
    end
  end

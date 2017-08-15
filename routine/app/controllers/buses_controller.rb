class BusesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def busroute
    response = HTTParty.get('http://www.ctabustracker.com/bustime/api/v2/getroutes/?key=54sFweh2PbzUdD4hegTEwqpgk&format=json')
    parsedbuses = JSON.parse(response.body)
    @busroutes = parsedbuses["bustime-response"]["routes"]
  end

  def busdirection
    @url = request.original_url
    @uri = URI::parse(@url)
    @rt = @uri.path.split('.')[1]
    response = HTTParty.get('http://www.ctabustracker.com/bustime/api/v2/getdirections/?key=' + '54sFweh2PbzUdD4hegTEwqpgk' + '&rt=' + @rt + '&format=json')
    parseddirections = JSON.parse(response.body)
    @busdirections = parseddirections["bustime-response"]["directions"]
  end

  def busstop
    @url = request.original_url
    @uriurl = URI::parse(@url)
    @businfo = @uriurl.path.split('.')[1]
    @rt = @businfo.split("-")[0]
    @dir = @businfo.split("-")[1]
    response = HTTParty.get('http://ctabustracker.com/bustime/api/v2/getstops?key=' + '54sFweh2PbzUdD4hegTEwqpgk' + '&rt=' + @rt + '&dir=' + @dir + '&format=json')
    parsedstops = JSON.parse(response.body)
    @busstops = parsedstops["bustime-response"]["stops"]
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

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end

class BusesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @bus = current_user.buses.build(bus_params)
    if @bus.save
      flash[:success] = "Route created!"
      redirect_to root_url
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

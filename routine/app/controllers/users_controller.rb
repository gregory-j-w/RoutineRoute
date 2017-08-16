class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @buses = @user.buses
    @bustimes = []
      @buses.each do |bus|
        response = HTTParty.get('http://www.ctabustracker.com/bustime/api/v2/getpredictions?key=54sFweh2PbzUdD4hegTEwqpgk&rt=' + bus.rt + '&stpid=' + bus.stpid + '&top=3&format=json')
        parsedbustimes = JSON.parse(response.body)
        if parsedbustimes["bustime-response"]["prd"]
          @bustimes.push(parsedbustimes)
        end
      end



  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Routine Route!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end

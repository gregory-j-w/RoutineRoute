class LtrainsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def ltrainsroute
  end

  def ltrainsdestination
    @rt = params[:rt]
  end

  def ltrainsdestination
  end

  def ltrainsave
    @rt = params[:rt]
    @destNm = params[:destNm]
    @stpId = params[:stpId]
    @staNm = params[:staNm]
  end

  def create
    @ltrain = current_user.ltrains.build(ltrain_params)
    if @ltrain.save
      flash[:success] = "Route created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @id = params[:id]
    @ltrain = Ltrain.find(@id)
    @ltrain.destroy
    flash[:success] = "Route deleted"
    redirect_to request.referrer || current_user
  end

  private
    def ltrain_params
      params.require(:ltrain).permit!
  end

  def correct_user
    @ltrain = current_user.ltrains.find_by(id: params[:id])
    redirect_to root_url if @ltrain.nil?
  end



end

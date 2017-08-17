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
  end



  def create
  end

  def destroy
  end

  private

end

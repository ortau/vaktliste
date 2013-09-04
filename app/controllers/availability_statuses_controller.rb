class AvailabilityStatusesController < ApplicationController

  def index
    @season = Season.last
  end

  def ajax_update
    @status = AvailabilityStatus.find(params[:id])
    @field = params[:user_input][:field]
    value = params[:user_input][:value]
    if @field == "available"
      @status.available=value
    elsif @field == "on_wishlist"
      @status.on_wishlist=value
    end

    respond_to do |format|
      format.js
    end
  end

end

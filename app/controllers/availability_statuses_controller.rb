class AvailabilityStatusesController < ApplicationController

  def index
    @season = Season.last
    @season.open_weeks_with_days.each do |k, v|
      v.each do |day|
        status = AvailabilityStatus.where("user_id = ? and workday_id = ?", @current_user.id, day.id).first
        if status.nil?
          status = AvailabilityStatus.new
          status.user_id = @current_user.id
          status.workday_id = day.id
          status.on_wishlist = false
          status.save
        end
      end
    end
  end

  def ajax_update
    @status = AvailabilityStatus.find(params[:id])
    @field = params[:user_input][:field]
    value = params[:user_input][:value]
    if @field == "available"
      @status.available=value.to_sym
      puts "available set to #{value}"
    elsif @field == "on_wishlist"
      @status.on_wishlist=value
      puts "on_wishlist set to #{value}"
    end
    @status.save
    puts "Availability status saved: #{status.to_s}"

    respond_to do |format|
      format.js
    end
  end

end

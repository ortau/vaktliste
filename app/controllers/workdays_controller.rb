class WorkdaysController < ApplicationController
  def update
    puts params
    @day = Workday.find(params[:id])
    puts "Day: #{@day.date}"
    field = params[:person][:field]
    value = params[:person][:value]

    if !value.nil?
      eval("@day.#{field}=#{value}")
      @day.save

      @person_1 = User.find(@day.person_1_id) unless @day.person_1_id.nil?
      @person_2 = User.find(@day.person_2_id) unless @day.person_2_id.nil?

    end

    respond_to do |format|
      format.js
    end

  end
end

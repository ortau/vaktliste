class Workday < ActiveRecord::Base
  belongs_to :person_1, :class_name => 'User'
  belongs_to :person_2, :class_name => 'User'
  belongs_to :season
  has_many :availability_statuses

  def status_level
    if person_1.nil? && person_2.nil?
      "not_staffed"
    elsif (!person_1.nil? && person_2.nil?) || (person_1.nil? && !person_2.nil?)
      "partially_staffed"
    else
      "staffed"
    end
  end

  def availability_status_for(user_id)
    status = AvailabilityStatus.where("user_id = ? and workday_id = ?", user_id, id).first
    if status.nil?
      status = AvailabilityStatus.new
      status.user_id = user_id
      status.workday_id = id
      status.on_wishlist = false
      status.save
    end
    return status
  end

  def availability_info
    availability_statuses.all
  end

end

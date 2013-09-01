class AvailabilityStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :workday

  STATUS = { available: 0, unavailable: 1, undecided: 2 }

  def available
    STATUS.key(read_attribute(:available))
  end

  def available=(s)
    write_attribute(:available, STATUS[s])
  end

  def checked?
    empty = " "
    if on_wishlist
      "checked=\"checked\""
    else
      empty
    end
  end

  def to_s
    "user_id: #{user_id}, workday_id: #{workday_id}, on_wishlist: #{on_wishlist}"
  end
end

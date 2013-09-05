class AvailabilityStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :workday

  STATUS = { available: 0, unavailable: 1, undecided: 2 }

  def available
    status = STATUS.key(read_attribute(:available))
    if status == :available
      "Tilgjengeleg"
    elsif status == :unavailable
      "Ikkje tilgjengeleg"
    else
      "Veit ikkje"
    end
  end

  def available=(s)
    write_attribute(:available, STATUS[s])
  end

  def on_wishlist_checked
    empty = " "
    if on_wishlist
      "checked=\"checked\""
    else
      empty
    end
  end


  def selected_availability(selected)
    empty = " "
    status = STATUS.key(read_attribute(:available))
    if status == selected.to_sym
      return "checked=\"checked\""
    end
    return empty
  end

  def to_s
    "user_id: #{user_id}, workday_id: #{workday_id}, on_wishlist: #{on_wishlist}"
  end
end

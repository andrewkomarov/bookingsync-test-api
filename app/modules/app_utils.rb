module AppUtils

  require 'date'

  def dateDifference start_at, end_at
    date1 = Date.parse start_at
    date2 = Date.parse end_at
    (date2-date1).to_i
  end

end

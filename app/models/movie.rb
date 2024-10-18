class Movie < ApplicationRecord
  def showing_status
    is_showing ? '上映中' : '上映予定'
  end
end

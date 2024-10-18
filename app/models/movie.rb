class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :year, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  # is_showingはtrue又はfalseでなければならない
  validates :is_showing, inclusion: { in: [true, false] }

  def showing_status
    is_showing ? '上映中' : '上映予定'
  end
end

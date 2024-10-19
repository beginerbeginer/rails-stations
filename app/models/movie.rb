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

  def self.search(keyword:, is_showing:)
    movies = all

    movies = apply_keyword_filter(movies, keyword) if keyword.present?

    movies = apply_is_showing_filter(movies, is_showing) if is_showing.present?

    movies
  end

  private

  def self.apply_keyword_filter(movies, keyword)
    # SQLインジェクションの対策、検索キーワードに含まれる特殊文字をエスケープする
    # @see https://api.rubyonrails.org/classes/ActiveRecord/Sanitization/ClassMethods.html#method-i-sanitize_sql_like
    keyword_query = "%#{sanitize_sql_like(keyword)}%"
    movies.where('name LIKE ? OR description LIKE ?', keyword_query, keyword_query)
  end

  def self.apply_is_showing_filter(movies, is_showing)
    is_showing_value = ActiveRecord::Type::Boolean.new.cast(is_showing)
    movies.where(is_showing: is_showing_value)
  end
end

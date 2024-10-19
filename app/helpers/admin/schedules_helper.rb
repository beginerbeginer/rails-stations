module Admin::SchedulesHelper
  # スケジュールの開始時刻と終了時刻をフォーマットして返す
  def format_schedule_time(schedule)
    "開始: #{schedule.start_time.strftime('%Y-%m-%d %H:%M:%S')}, 終了: #{schedule.end_time.strftime('%Y-%m-%d %H:%M:%S')}"
  end
end
